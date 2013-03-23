@Page.module "RecordsApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	class List.Layout extends App.Views.Layout
		template: "records/list/templates/list_layout"
		
		regions:
			panelRegion: "#panel-region"
			recordsRegion: "#records-region"
			addrecordRegion: "#addrecord-region"
	
	class List.Panel extends App.Views.ItemView
		template: "records/list/templates/_panel"
	
	class List.AddRecord extends App.Views.ItemView
		template: "records/list/templates/_add"		
	
	class List.Record extends App.Views.ItemView
		template: "records/list/templates/_record"
		tagName: "tr"
	
	class List.Empty extends App.Views.ItemView
		template: "records/list/templates/_empty"
		tagName: "tr"
	
	class List.Records extends App.Views.CompositeView
		template: "records/list/templates/_records"
		itemView: List.Record
		emptyView: List.Empty
		itemViewContainer: "tbody"