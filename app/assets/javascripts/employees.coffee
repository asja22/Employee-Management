# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $('#employee_doj').datepicker
    dateFormat: 'yy-mm-dd'
	
$(document).on 'turbolinks:load', ->
  $('#employee_position_id')#.parent().hide()
  positions = $('#employee_position_id').html()
  $('#employee_department_id').change ->
    department = $('#employee_department_id :selected').text()
   # escaped_department = department.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(positions).filter("optgroup[label='#{department}']").html()
    if options
      $('#employee_position_id').html(options)
     # $('#employee_position').parent().show()
    else
      $('##employee_position_id').empty()
      #$('#employee_position').parent().hide()

	