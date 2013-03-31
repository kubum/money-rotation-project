@Page.module "AccountApp", (AccountApp, App, Backbone, Marionette, $, _) ->
	
	class AccountApp.Router extends Marionette.AppRouter
		appRoutes:
			"account" : "main"
		
		API =
			main: ->
				AccountApp.Main.Controller.show()
		
		App.addInitializer ->
			new AccountApp.Router
				controller: API