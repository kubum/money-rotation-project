@Page.module "RecordsApp.List", (List, App, Backbone, Marionette, $, _) ->
  
  List.Controller =
    
    listRecords: ->
      App.request "record:entities", (records) =>
      
        @layout = @getLayoutView()
      
        @layout.on "show", =>
          @showAddRecord()
          @showPanel records
          @showRecords records
      
        App.mainRegion.show @layout
    
    showAddRecord: ->
      addRecordView = @getAddRecordView()
      @layout.addrecordRegion.show addRecordView
    
    showPanel: (records) ->
      panelView = @getPanelView records
      @layout.panelRegion.show panelView
    
    showRecords: (records) ->
      recordsView = @getRecordsView records
      @layout.recordsRegion.show recordsView
    
    getAddRecordView: ->
      new List.AddRecord
    
    getRecordsView: (records) ->
      new List.Records
        collection: records
      
    getPanelView: (records) ->
      new List.Panel
        collection: records
    
    getLayoutView: ->
      new List.Layout