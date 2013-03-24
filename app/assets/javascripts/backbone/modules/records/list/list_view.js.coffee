@Page.module "RecordsApp.List", (List, App, Backbone, Marionette, $, _) ->
  
  class List.Layout extends App.Views.Layout
    template: JST["backbone/modules/records/list/templates/list_layout"]
    
    regions:
      panelRegion: "#panel-region"
      recordsRegion: "#records-region"
      addrecordRegion: "#addrecord-region"
      paginationRegion: "#pagination-region"
  
  class List.Panel extends App.Views.ItemView
    template: JST["backbone/modules/records/list/templates/_panel"]
    
    initialize: ->
      @collection.fullCollection.on('add', @render, @)
      
    render: ->
      $(@el).html(@template(state: @collection.state))
  
  class List.Record extends App.Views.ItemView
    template: JST["backbone/modules/records/list/templates/_record"]
    tagName: "tr"
  
  class List.Empty extends App.Views.ItemView
    template: JST["backbone/modules/records/list/templates/_empty"]
    tagName: "tr"
    
  class List.Records extends App.Views.CompositeView
    template: JST["backbone/modules/records/list/templates/_records"]
    itemView: List.Record
    emptyView: List.Empty
    itemViewContainer: "tbody"
    
  class List.Pagination extends App.Views.ItemView
    template: JST["backbone/modules/records/list/templates/_pagination"]
    events:
      "click li:not(.disabled)": "pageSelect"    
            
    initialize: ->
      @collection.fullCollection.on('add', @render, @)
        
    render: ->
      if @collection.state.totalPages > 1
        $(@el).addClass("pagination pagination-centered")
        $(@el).html(@template(pagination: @collection))
        
    pageSelect: (e) ->
      if $(e.target).parent().is('#prev')
        @collection.getPreviousPage()      
      else if $(e.target).parent().is('#next')
        @collection.getNextPage()
      else
        @collection.getPage($(e.target).text())
        
      @render()
      
      false
