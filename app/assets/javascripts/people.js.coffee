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
			
	# set up the person_type radio selection area. If someone is a Faculty, Grad Student or Staff, they can
	# have office hours, research periods, etc.. If Donor or Undergraduate, they only have Basic Information
	adv_features = ['Faculty', 'Graduate Student', 'Staff']
	basic_features = ['Donor', 'Undergraduate Student']
	$("li.choice > label > input").click ->
		console.log('hi')
		if($.inArray($(this).val(), adv_features) >= 0) 
			$('#person_office_hours').show()
		else if($.inArray( $(this).val(), basic_features) >=0)
			$('#person_office_hours').hide()
			
	$("li.choice > label > input#person_person_type_faculty").click()