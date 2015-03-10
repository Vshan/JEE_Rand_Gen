jQuery ->
 @prev=-1
#IMPLEMENTING DYNAMIC DROPDOWNS
 $('#question_topiccode').parent().hide()
 topics = $('#question_topiccode').html()
 $('#question_subject').change ->
  subject = $('#question_subject :selected').text()
  if(subject!='All')
   options = '<option value=1>All topics</option>'
  options += $(topics).filter("optgroup[label='#{subject}']").html()
  soptions = '<option value=1>All Subtopics</option>'
  $('#question_topiccode').empty()
  $('#question_stopic').empty()
  $('#question_topiccode').parent().hide()
  $('#question_stopic').parent().hide()
  if (options &&  subject != 'All')
   $('#question_topiccode').html(options)
   $('#question_topiccode').parent().show()


 $('#question_stopic').parent().hide()
 subtopics = $('#question_stopic').html()
 $('#question_topiccode').change ->
  topic = $('#question_topiccode :selected').text()
  if(topic!='All Topics')
   soptions = '<option value=1>All Subtopics</option>'
  soptions += $(subtopics).filter("optgroup[label='#{topic}']").html()

  if (soptions &&  topic != 'All Topics')
   $('#question_stopic').html(soptions)
   $('#question_stopic').parent().show()
  else
   $('#question_stopic').empty()
   $('#question_stopic').parent().hide()
   
#COUNTDOWN TIMER IMPLEMENTED BY AKSHAY R
 $('#untilt').countdown({until: '+30m', format:'MS', compact:true})
 if ($('#untilt').length != 0)
  setInterval (->
   periods=$('#untilt').countdown('getTimes')
   $('#circlet').circleProgress({
        value: periods[5]/30,
        size: 80,
        animation:false,
        startAngle:-Math.PI/2,
        fill: {
            gradient: ["magenta","blue"  ]
        }
    })
   if(periods[5]==0 && periods[6]==0)
    $(".qpsubmit" ).click();
  ), 1000

#ADD CLASS WITH NUMBERS - AKSHAY R
 $('.quesx').each (i) ->
  $(this).removeClass 'quesx'
  $(this).addClass 'ques ques-number-' + (i + 1)
  if(i!=0)
   $(this).hide()
  $('.links').append ('<a class="'+(i+1)+' ndone" href=# onClick=toggleItem('+(i+1)+')><font size=3>&nbsp;'+(i+1)+'&nbsp;</font></a>')
  $('.links').append ('&nbsp;&nbsp;&nbsp;')
  if((i+1)%10==0)
   $('.links').append ('<br>') 
 $('.sub').each (i) ->
  $(this).addClass 'sub-' + (i + 1)
  $(this).hide()

#TOGGLE ITEMS FROM LINKS - AKSHAY R
 @toggleItem = (id) ->
  $('.ques').each (i) ->
    if $(this).hasClass('ques-number-' + id)
      $(this).show()
    else
      $(this).hide()
  return

#CHECK / UNCHECK OF RADIO BUTTON - AKSHAY R
 radioButtons = $('input[type=\'radio\']')
 radioStates = {}
 $.each radioButtons, (index, rd) ->
  radioStates[rd.value] = $(rd).is(':checked')
 radioButtons.click ->
  c=0
  val = $(this).val()
  selectedIndex = radioButtons.index(this)
  $(this).attr 'checked', radioStates[val] = !radioStates[val]
  $('a').each (i) ->
    if $(this).hasClass(Math.floor(selectedIndex/4)+1)
      $(this).addClass 'done'
  $.each radioButtons, (index, rd) ->
    if rd.value != val
      radioStates[rd.value] = false
  for i in [1...4] by 1
   if($(this).is(':checked'))
    c=c+1
  if(c==0)
   $('a').each (i) ->
    if $(this).hasClass(Math.floor(selectedIndex/4)+1)
     $(this).removeClass 'done'
     $(this).addClass 'ndone'

 $(".ndone").click ->
  $('a').each (i) ->
    if $(this).hasClass('onit')
      $(this).removeClass 'onit'
  if !($(this).hasClass('onit'))
   $(this).addClass 'onit'