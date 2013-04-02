@Page.module "StatisticsApp", (StatisticsApp, App, Backbone, Marionette, $, _) ->
  
  class StatisticsApp.Router extends Marionette.AppRouter
    appRoutes:
      "statistics/week"  : "week"
      "statistics/month" : "month"
      "statistics/all"   : "all"
      "statistics"       : "week"
    
    API =
      week: ->
        StatisticsApp.Main.Controller.week()
    
      month: ->
        StatisticsApp.Main.Controller.month()
      
      all: ->
        StatisticsApp.Main.Controller.all()
        
    App.addInitializer ->
      new StatisticsApp.Router
        controller: API