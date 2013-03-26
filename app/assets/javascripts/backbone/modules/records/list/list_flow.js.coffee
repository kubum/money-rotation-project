@Page.module "RecordsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Flow extends App.Views.ItemView
    template: JST["backbone/modules/records/list/templates/flow"]
    tagName: "div"
        
    render: ->
      @calculate()
      
      $(@el).html(@template(income: @income, expense: @expense))
      
      @onRender()
        
    onRender: ->        
      url = "#" + Backbone.history.fragment
      
      for li in @$el.find("li")
        if url == $(li).find("a").attr('href')
          $(li).addClass("active")
          
    calculate: ->
      @income  = @collection.calculateIncome()
      @expense = @collection.calculateExpense()