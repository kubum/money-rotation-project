@Page.module "AccountApp.Main", (Main, App, Backbone, Marionette, $, _) ->
  
  class Main.Show extends App.Views.ItemView
    template: JST["backbone/modules/account/main/templates/show"]
    
    events:
      "submit #edit_user": "editUser"
      "submit #cancel_user": "cancelUser"
    
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
        console.log(response)
        
        errors = $.parseJSON(response.responseText).errors
        
        # console.log(errors)
        
        for id, message of errors
          $("#edit_user .errors ul").append("<li>" + message + "</li>")

        $('#edit_user .errors').slideDown('fast')
        
      # console.log(user)
      # console.log(response)
      console.log("error!")
    
    cancelUser: ->  
      console.log("cancel")
        
      false