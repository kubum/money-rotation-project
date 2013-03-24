@Page.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->
  
  class List.Header extends App.Views.ItemView
    template: JST["backbone/modules/header/list/templates/_header"]
    tagName: "button"  
    events:
      'click': 'navigate'  
    
    onRender: ->
      @$el.addClass("active") if App.getCurrentRoute() == @model.get('url')
      @$el.addClass("btn")
    
    navigate: ->
      $("#navigation button").removeClass("active")
      @$el.addClass("active")
      
      App.navigate('#' + @model.get('url'), trigger: true)
  
  class List.Headers extends App.Views.CompositeView
    template: JST["backbone/modules/header/list/templates/headers"]
    itemView: List.Header
    itemViewContainer: "#navigation div"
    events:
      'click #logout': 'logout'
      
    logout: ->
      window.location = "/users/sign_out"
    