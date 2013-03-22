@Page.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.Header extends Entities.Model
	
	class Entities.HeaderCollection extends Entities.Collection
		model: Entities.Header
	
	API =
		getHeaders: ->
			new Entities.HeaderCollection [
				{ name: "Records", url: "records" }
				{ name: "Statistics", url: "statistics" }
			]
	
	App.reqres.addHandler "header:entities", ->
		API.getHeaders()