require 'securerandom'

class RandomController < ApplicationController
  before_filter :authenticate_both!,
    :only => [ :create]
  def enable
    @no_of_questions = 5
    @questions = Question.all
  end
  def show
    set_question
  end

  def index
    enable
    @scodes = Scode.all
    @scode=[]
    @scodes.find_each do |s|
       @scode.push([s.sname, s.id])
    end
     @tcodes = Topiccode.all
     @tcode=[]
     @tcodes.find_each do |t|
       @tcode.push([t.tname, t.id])
    end
     @stcodes = Subtopiccode.all
     @stcode=[]
     @stcodes.find_each do |st|
       @stcode.push([st.stname, st.id])
    end
  end

  def generate_question(subject)
    subq = []
    enable.find_each do |question|
      if question.subjectcode == subject
        subq << question
      end 
    end
    a = [SecureRandom.random_number(subq.size)]
    while(a.size != @no_of_questions) do
      b = SecureRandom.random_number(subq.size)
      a.each do |e|
        if e == b
          a.delete(e)
        end
      end
      a.push(b)
    end
    rques = []
    a.each do |n|
      subq.each_with_index do |question, index|
        if n == index
          rques << question
        end
      end
    end
    rques
  end

  def oqvalidate(params)
    index
    answer = params[:question]
    if(answer.size != 1)
      answer.each do |id, choice|
      unless(choice == "")
        @question_chosen = Question.find(id.to_i)
        if @question_chosen.ro == choice
          @op = 1
        else
          @op = 0
        end
      end
      end
    else 
      answer.each {|k,v| @q_id = eval(k)[:q_id].to_i }
    end
  end

  def qpvalidate(params)
    index
    @score = 0
    @right_ans = 0
    @subm = []
    @subr = []
    Scode.all.find_each do |sub|
      @subm[sub.scode] = 0
      @subr[sub.scode] =0
    end
    answers = params[:question]
    if(answers)
    answers.each do |id, choice| 
      quer_ques = Question.find(id.to_i)
      if quer_ques.ro == choice
        @right_ans += 4
        @subm[quer_ques.subjectcode] += 1
      else
        @right_ans -= 1
        @subr[quer_ques.subjectcode] += 1
      end
    end
  end
    @score = @right_ans
  end

  def quespaper
    @sub = []
    @scodes = Scode.all
    @scodes.find_each do |s|
      unless s.scode == 1
        @sub[s.scode]=(generate_question(s.scode))
      end
    end
  end

  def set_param

  end

  def create 
    respond_to do |format|
      if params[:commit] == "Generate Question Paper"
        format.html do
          quespaper
          render action: 'quespaper'
        end
      elsif params[:commit] == "Generate Single Question"
        format.html do
          ques_codes = params[:question]
          @qid= random(ques_codes)
          redirect_to :action => "show", :id => @qid
        end
      elsif params[:commit] == "Generate Another Question"
         format.html do
          redirect_to "/"
        end
      elsif params[:commit] == "Go back"
         format.html do
         params[:question].find_each {|k,v| @qid = Question.find(eval(k)[:q_id].to_i) }
         redirect_to :action => "show", :id => @qid
        end
      elsif params[:commit] == "Go!"
        format.html do 
          oqvalidate(params)
          render action: 'oqvalidate'
        end
      elsif params[:commit] == "Submit Paper"
        format.html  do
          qpvalidate(params)
          render action: 'qpvalidate'
        end
      end
    end
  end



  def random(ques_codes)
    subq = []
    question_code = ques_codes[:subject].to_i
    topic_code = ques_codes[:topiccode].to_i
    subtopic_code = ques_codes[:stopic].to_i
    enable.find_each do |question|
      aqcode = question.subjectcode
      atcode = question.topiccode
      astcode = question.stopiccode 
      if (aqcode == question_code) && (atcode == topic_code) && (astcode == subtopic_code)
        subq << question
      elsif question_code == 1
       subq = Question.all
      elsif (aqcode == question_code) && (topic_code == 1)
       subq << question 
      elsif (aqcode == question_code) && (atcode == topic_code) && (subtopic_code == 1)
        subq << question
      end
    end
    if subq.empty?
      subq << Question.new(question: "No question found with specified conditions", opa: 1, opb: 1, opc: 1, opd: 1, ro: 'A', year: Date.parse("12-12-2014"), examcode: 0, subjectcode: 1, topiccode: 1, stopiccode: 1)
    end
    subq[SecureRandom.random_number(subq.size)]
  end
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @questionx = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:question, :opa, :opb, :opc, :opd, :ro, :year, :examcode, :subjectcode, :topiccode, :stopiccode)
    end
end
