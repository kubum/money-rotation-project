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
      pageSize: 5
      sortKey: 'id'
      order: 1

    calculateIncome: ->
      @fullCollection.where({flow: "income"}).reduce ((memo, value) ->
        memo + value.get("amount")
      ), 0
    
    calculateExpense: ->
      @fullCollection.where({flow: "expense"}).reduce ((memo, value) ->
        memo + value.get("amount")
      ), 0
    
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
          
    getRecordStatistics: (cb) ->
      $.get "/api/records/statistics", (records) ->
        cb records
    
  App.reqres.addHandler "record:entities", (cb) ->
    API.getRecordEntities cb
    
  App.reqres.addHandler "record:entities:paginated", (cb) ->
    API.getRecordEntitiesPaginated cb
    
  App.reqres.addHandler "record:statistics", (cb) ->
    API.getRecordStatistics cb
    