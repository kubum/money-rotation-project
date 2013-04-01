@Page.module "StatisticsApp.Main", (Main, App, Backbone, Marionette, $, _) ->
  
  class Main.Show extends App.Views.ItemView
    template: JST["backbone/modules/statistics/main/templates/show"]
    
    onShow: ->
      App.request "record:statistics", (records) =>
     
        $.plot "#placeholder", [records],
          xaxis:
            mode: "time"
            min: (new Date(2013, 0, 1)).getTime()
            max: (new Date(2013, 5, 31)).getTime()
          yaxis:
            min: 0
            

        $("#by_week").click ->
          $.plot "#placeholder", [records],
            xaxis:
              mode: "time"
              
          false


        $("#by_month").click ->
          $.plot "#placeholder", [records],
            xaxis:
              mode: "time"
              min: (new Date(1990, 0, 1)).getTime()
              max: (new Date(2000, 0, 1)).getTime()
              
          false


        $("#by_all").click ->
          $.plot "#placeholder", [records],
            xaxis:
              mode: "time"
              minTickSize: [1, "year"]
              min: (new Date(1996, 0, 1)).getTime()
              max: (new Date(2000, 0, 1)).getTime()
              
          false