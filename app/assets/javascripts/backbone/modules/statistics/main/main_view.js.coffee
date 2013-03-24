@Page.module "StatisticsApp.Main", (Main, App, Backbone, Marionette, $, _) ->
	
	class Main.Show extends App.Views.ItemView
		template: JST["backbone/modules/statistics/main/templates/show"]