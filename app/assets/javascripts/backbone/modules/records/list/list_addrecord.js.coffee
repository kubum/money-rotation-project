@Page.module "RecordsApp.List", (List, App, Backbone, Marionette, $, _) ->
  
  class List.AddRecord extends App.Views.ItemView
    template: "records/list/templates/_add"
    events:
      'click #add_button': 'showAddRecordForm'
      'click': 'hideAddRecordForm'
      'submit #new_record': 'createRecord'
  
    showAddRecordForm: (e) ->
      e.stopPropagation()
      @touchForm()      
    
    hideAddRecordForm: (e) ->
      container = $("#add_form")
    
      if container.is(":visible") && container.has(e.target).length == 0   
        @touchForm()    
    
    touchForm: ->
      @touchButton()
      @toggleForm()
      
    touchButton: ->
      $("#add_button button").toggleClass("active")
  
    toggleForm: ->
      $("#add_form").toggle("fast")
      
    createRecord: ->
      event.preventDefault()
      
      $('#new_record .errors').hide()
      
      attributes = 
        comment: $("#new_record_comment").val()
        amount: $("#new_record_amount").val()
      
      @collection.create attributes,
        wait: true
        success: @successAdded
        error: @handleError

    handleError: (entry, response) ->     
      if response.status == 422
        $('#new_record .errors ul').html("")

        errors = $.parseJSON(response.responseText).errors

        for id, message of errors
          $("#new_record .errors ul").append("<li>" + message + "</li>")

        $('#new_record .errors').slideDown('fast')

    successAdded: (entry, response) ->
      # Hide form
      $("#add_button button").toggleClass("active")
      $("#add_form").toggle("fast")
      
      # Clear inputs
      $('#new_record').find(":input[type='text']").each( 
        (id, element) -> $(element).val("")          
      )
      # Success info
      $("#add_success").toggle('fast').delay(2000).toggle('fast');
