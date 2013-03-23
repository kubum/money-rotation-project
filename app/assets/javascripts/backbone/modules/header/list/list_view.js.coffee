@Page.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->
  
  class List.Header extends App.Views.ItemView
    template: "header/list/templates/_header"
    tagName: "button"  
      
    onRender: ->
      @$el.addClass("btn")
  
  class List.Headers extends App.Views.CompositeView
    template: "header/list/templates/headers"
    itemView: List.Header
    itemViewContainer: "#navigation div"