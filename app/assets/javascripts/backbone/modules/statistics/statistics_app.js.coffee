@Page.module "StatisticsApp", (StatisticsApp, App, Backbone, Marionette, $, _) ->
	
	class StatisticsApp.Router extends Marionette.AppRouter
		appRoutes:
			"statistics" : "main"
		
		API =
			main: ->
				StatisticsApp.Main.Controller.show()
		
		App.addInitializer ->
			new StatisticsApp.Router
				controller: API