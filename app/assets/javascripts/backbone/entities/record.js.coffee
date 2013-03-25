@Page.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
  
  class Entities.Record extends Entities.Model
  
  class Entities.RecordsCollection extends Entities.Collection
    model: Entities.Record
    url: '/api/records'
    idAttribute: 'id'
  
  class Entities.RecordsPaginated extends Backbone.PageableCollection
    model: Entities.Record
    url: '/api/records'
    mode: "client"
    
    state:
      firstPage: 1
      currentPage: 1
      pageSize: 2
  
  API =
    getRecordEntities: (cb) ->
      records = new Entities.RecordsCollection
      records.fetch
        success: ->
          cb records
          
    getRecordEntitiesPaginated: (cb) ->
      records = new Entities.RecordsPaginated
      records.fetch
        success: ->
          cb records
    
  App.reqres.addHandler "record:entities", (cb) ->
    API.getRecordEntities cb
    
  App.reqres.addHandler "record:entities:paginated", (cb) ->
    API.getRecordEntitiesPaginated cb