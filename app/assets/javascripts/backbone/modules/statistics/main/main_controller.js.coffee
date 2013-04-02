@Page.module "StatisticsApp.Main", (Main, App, Backbone, Marionette, $, _) ->
  
  Main.Controller =
    
    show: ->
      current_user = App.request "get:current:user"
      current_user.fetch()
      
      App.request "record:statistics", (records) => 
        view = @getIndexView records, current_user
        App.mainRegion.show view
    
    getIndexView: (records, current_user) ->
      new Main.Show 
        records: records
        current_user: current_user