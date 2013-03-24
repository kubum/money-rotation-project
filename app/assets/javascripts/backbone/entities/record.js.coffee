@Page.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
  
  class Entities.Record extends Entities.Model
  
  class Entities.RecordsCollection extends Entities.Collection
    model: Entities.Record
    url: '/api/records'
    
  API =
    getRecordEntities: (cb) ->
      records = new Entities.RecordsCollection
      records.fetch
        success: ->
          cb records
    
  App.reqres.addHandler "record:entities", (cb) ->
    API.getRecordEntities cb