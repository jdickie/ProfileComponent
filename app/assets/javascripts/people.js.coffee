# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# initiating the datatables for sorting through people
jQuery ->
	$('#people').dataTable
		bJQueryUI: true
		
	# initiating the click animation for each item in the _person form
	$('.field > .header').click ->
		if $(this).parent().hasClass('inactive')
			$(this).parent().removeClass('inactive')
			$(this).parent().addClass('active')
		else
			$(this).parent().removeClass('active')
			$(this).parent().addClass('inactive')