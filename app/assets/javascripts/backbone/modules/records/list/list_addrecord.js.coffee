@Page.module "RecordsApp.List", (List, App, Backbone, Marionette, $, _) ->
  
  class List.AddRecord extends App.Views.ItemView
    template: JST["backbone/modules/records/list/templates/_add"]
    events:
      'click #add_button': 'showAddRecordForm'
      'click': 'hideAddRecordForm'
      'submit #new_record': 'createRecord'
          
    serializeData: ->
      currentFlow: ->
        Backbone.history.fragment.split("/").pop()
            
    showAddRecordForm: (e) ->
      e.stopPropagation()
      @touchForm()
      
      radio = @$el.find("#new_record input[type='radio'][name='flow']")
      
      if @currentFlow() == "income" || @currentFlow() == "expense"
        if @currentFlow() == "income" then $("#new_record_flow_income").attr('checked', true)
        if @currentFlow() == "expense" then $("#new_record_flow_expense").attr('checked', true)
          
        radio.attr('disabled', true)
      else
        radio.attr('disabled', false)
    
    hideAddRecordForm: (e) ->
      container = $("#add_form")
      if container.is(":visible") && !container.is(e.target) && container.has(e.target).length == 0   
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
        flow: $("#new_record input[type='radio'][name='flow']:checked").val()
      
      @collection.fullCollection.create attributes,
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
      $("#add_success").toggle('fast').delay(2000).toggle('fast')
      
    currentFlow: ->
      Backbone.history.fragment.split("/").pop()