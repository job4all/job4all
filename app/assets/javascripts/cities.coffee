# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#city_state_id').parent().hide()
  states = $('#city_state_id').html()
  $('#city_country_id').change ->
    country = $('#city_country_id :selected').text()
    escaped_country = country.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(states).filter("optgroup[label='#{escaped_country}']").html()
    if options
      $('#city_state_id').html(options)
      $('#city_state_id').parent().show()
    else
      $('#city_state_id').empty()
      $('#city_state_id').parent().hide()

