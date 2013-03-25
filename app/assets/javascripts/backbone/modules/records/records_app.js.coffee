@Page.module "RecordsApp", (RecordsApp, App, Backbone, Marionette, $, _) ->
  
  class RecordsApp.Router extends Marionette.AppRouter
    appRoutes:
      "records": "listRecords"
      "records/:flow": "listRecordsByFlow"
  
  API =
    listRecords: ->
      RecordsApp.List.Controller.listRecords()
    
    listRecordsByFlow: (flow) ->  
      RecordsApp.List.Controller.listRecordsByFlow(flow)
  
  App.addInitializer ->
    new RecordsApp.Router
      controller: API