@Page.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.User extends Entities.Model
	  idAttribute: "id"
	  paramRoot: "user"
	  
	  toJSON: ->
	    id: @get("id")
	    email: @get("email")
	    password: @get("password")
	    password_confirmation: @get("password_confirmation")
	    current_password: @get("current_password")

    methodToURL:
      'read': '/userinfo.json'
      'update': '/users.json'
      'delete': '/users.json'

    sync: (method, model, options) ->
      options = options || {}
      options.url = model.methodToURL[method.toLowerCase()]

      Backbone.sync(method, model, options)
    
	class Entities.UsersCollection extends Entities.Collection
		model: Entities.User
	  
	API =
		setCurrentUser: (currentUser) ->
			new Entities.User currentUser
  			
	App.reqres.addHandler "set:current:user", (currentUser) ->
		API.setCurrentUser currentUser