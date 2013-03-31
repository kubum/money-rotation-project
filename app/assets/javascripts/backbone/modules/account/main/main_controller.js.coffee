@Page.module "AccountApp.Main", (Main, App, Backbone, Marionette, $, _) ->
  
  Main.Controller =
    
    show: ->
      view = @getIndexView()
      App.mainRegion.show view
    
    getIndexView: ->
      new Main.Show