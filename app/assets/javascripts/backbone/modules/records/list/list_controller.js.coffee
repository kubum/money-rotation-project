@Page.module "RecordsApp.List", (List, App, Backbone, Marionette, $, _) ->
    
  List.Controller =
    
    listRecords: ->
      @layout = @getLayoutView()
      
      App.request "record:entities:paginated", (records) =>
        @layout.on "show", =>
          @showAddRecord records
          @showFlow records
          @showRecords records
          @showPagination records
          @showPanel records

        App.mainRegion.show @layout
        
    listRecordsByFlow: (flow) ->
      @layout = @getLayoutView()

      App.request "record:entities:paginated", (records) =>      
        filtered = new App.Entities.RecordsPaginated(records.fullCollection.where(flow: flow))
        
        @layout.on "show", =>
          @showAddRecord filtered
          @showFlow records
          @showRecords filtered
          @showPagination filtered
          @showPanel filtered

        App.mainRegion.show @layout
    
    showAddRecord: (records, filtered) ->
      addRecordView = @getAddRecordView(records, filtered)
      @layout.addrecordRegion.show addRecordView
    
    showFlow: (records) ->
      if not records?
        App.request "record:entities:paginated", (records) =>
          @updateFlow(records)
      else
        @updateFlow(records)
        
    updateFlow: (records) ->
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