# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
 $('#question_topiccode').parent().hide()
 topics = $('#question_topiccode').html()
 $('#question_subjectcode').change ->
  subject = $('#question_subjectcode :selected').text()
  if(subject!='All')
   options = '<option value=1>All topics</option>'
  options += $(topics).filter("optgroup[label='#{subject}']").html()
  soptions = '<option value=1>All Subtopics</option>'
  $('#question_topiccode').empty()
  $('#question_topiccode').parent().hide()
  $('#question_stopiccode').parent().hide()
  if (options &&  subject != 'All')
   $('#question_topiccode').html(options)
   $('#question_topiccode').parent().show()

 $('#question_stopiccode').parent().hide()
 subtopics = $('#question_stopiccode').html()
 $('#question_topiccode').change ->
  topic = $('#question_topiccode :selected').text()
  if(topic!='All Topics')
   soptions = '<option value=1>All Subtopics</option>'
  soptions += $(subtopics).filter("optgroup[label='#{topic}']").html()

  if (soptions &&  topic != 'All Topics')
   $('#question_stopiccode').html(soptions)
   $('#question_stopiccode').parent().show()
  else
   $('#question_stopiccode').empty()
   $('#question_stopiccode').parent().hide()