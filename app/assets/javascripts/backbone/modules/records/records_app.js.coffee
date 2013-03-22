@Page.module "RecordsApp", (RecordsApp, App, Backbone, Marionette, $, _) ->
	
	class RecordsApp.Router extends Marionette.AppRouter
		appRoutes:
			"records"	: "listRecords"
	
	API =
		listRecords: ->
			RecordsApp.List.Controller.listRecords()
	
	App.addInitializer ->
		new RecordsApp.Router
			controller: API