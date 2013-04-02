@Page.module "AccountApp.Main", (Main, App, Backbone, Marionette, $, _) ->
  
  class Main.Show extends App.Views.ItemView
    template: JST["backbone/modules/account/main/templates/show"]
    
    events:
      "submit #edit_user": "editUser"
      "click #cancel_user": "cancelUser"
    
    initialize: ->      
      @model.on('change', @render, @)
      
    onRender: ->
      @$el.find("#user_email").val(@model.get("email"))
      
    editUser: ->
      @model.save
        email: @$el.find("#user_email").val()
        password: @$el.find("#user_password").val()
        password_confirmation: @$el.find("#user_password_confirmation").val()
        current_password: @$el.find("#user_current_password").val()
      ,
        success: @successEdit
        error: @errorEdit
          
      false
    
    successEdit: (user, response) ->  
      $("#edit_success").toggle('fast').delay(2000).toggle('fast')
    
    errorEdit: (user, response) ->
      if response.status == 422
        $('#edit_user .errors ul').html("")
        
        errors = $.parseJSON(response.responseText).errors
                
        for id, message of errors
          $("#edit_user .errors ul").append("<li>" + message + "</li>")

        $('#edit_user .errors').slideDown('fast')
            
    cancelUser: ->
      @model.destroy
        success: @successDestroy
        
      false
      
    successDestroy: (user, response) ->
      window.location = "/users/sign_in"