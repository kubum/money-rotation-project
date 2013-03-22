@Page.module "RecordsApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	List.Controller =
		
		listRecords: ->
			App.request "record:entities", (records) =>
			
				@layout = @getLayoutView()
			
				@layout.on "show", =>
					@showPanel records
					@showRecords records
			
				App.mainRegion.show @layout
		
		showPanel: (records) ->
			panelView = @getPanelView records
			@layout.panelRegion.show panelView
		
		showRecords: (records) ->
			recordsView = @getRecordsView records
			@layout.recordsRegion.show recordsView
		
		getRecordsView: (records) ->
			new List.Records
				collection: records
			
		getPanelView: (records) ->
			new List.Panel
				collection: records
		
		getLayoutView: ->
			new List.Layout