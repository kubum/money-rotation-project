@Page.module "AccountApp.Main", (Main, App, Backbone, Marionette, $, _) ->
  
  Main.Controller =
    
    show: ->
      user = App.request "get:current:user"
      user.fetch
        success: ->
          accountView = new Main.Show(model: user)
          App.mainRegion.show accountView