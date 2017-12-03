# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#education_tdegree_id').chosen()
  $('#education_institute_id').chosen()
  $('#education_city_id').chosen()


jQuery ->
  $('#education_degree_id').parent().hide()
  degrees = $('#education_degree_id').html()
  $('#education_tdegree_id').change ->
    tdegree = $('#education_tdegree_id :selected').text()
    escaped_tdegree = tdegree.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(degrees).filter("optgroup[label='#{escaped_tdegree}']").html()
    if options
      $('#education_degree_id').html(options)
      $('#education_degree_id').parent().show()
    else
      $('#education_degree_id').empty()
      $('#education_degree_id').parent().hide()

