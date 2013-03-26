@Page.module "RecordsApp.List", (List, App, Backbone, Marionette, $, _) ->
  
  List.Controller =
    
    listRecords: ->
      @layout = @getLayoutView()
      
      App.request "record:entities:paginated", (records) =>  
        @showLayout(records)
        
    listRecordsByFlow: (flow) ->
      @layout = @getLayoutView()

      App.request "record:entities:paginated:" + flow, (records) =>
         @showLayout(records)
    
    showLayout: (records) ->
      @layout.on "show", =>
        @showAddRecord records
        @showFlow records
        @showRecords records
        @showPagination records
        @showPanel records
    
      App.mainRegion.show @layout
    
    showAddRecord: (records) ->
      addRecordView = @getAddRecordView records
      @layout.addrecordRegion.show addRecordView
    
    showFlow: (records) ->
      flowView = @getFlowView records
      @layout.flowRegion.show flowView
    
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
    
    getFlowView: (records) ->
      new List.Flow
        collection: records
    
    getLayoutView: ->
      new List.Layout