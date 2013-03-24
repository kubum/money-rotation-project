@Page.module "RecordsApp.List", (List, App, Backbone, Marionette, $, _) ->
  
  List.Controller =
    
    listRecords: ->
      @layout = @getLayoutView()
      
      App.request "record:entities", (records) =>            
        @layout.on "show", =>
          @showAddRecord records
          @showRecords records
          @showPanel records
      
        App.mainRegion.show @layout
    
    showAddRecord: (records) ->
      addRecordView = @getAddRecordView records
      @layout.addrecordRegion.show addRecordView
    
    showPanel: (records) ->
      panelView = @getPanelView records
      @layout.panelRegion.show panelView
    
    showRecords: (records) ->
      recordsView = @getRecordsView records
      @layout.recordsRegion.show recordsView
    
    showPagination: (records) ->
      paginationView = @getPaginationView records
      @layout.paginationRegion.show paginationView
    
    getAddRecordView: (records) ->
      new List.AddRecord
        collection: records
    
    getRecordsView: (records) ->
      new List.Records
        collection: records
    
    getPaginationView: (records) ->
      new List.Pagination
        collection: records
      
    getPanelView: (records) ->
      new List.Panel
        collection: records
    
    getLayoutView: ->
      new List.Layout