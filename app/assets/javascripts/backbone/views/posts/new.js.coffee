class App.module('Views.Posts').New extends Backbone.Marionette.ItemView
  template: 'posts/new'

  events:
    "submit #new-post": "save"

  bindings:
    '#title': 'title'
    '#content': 'content'

  initialize: (options) ->
    @model = new @collection.model()
    @listenTo @model, 'validated', (_, __, attrs)=> @showErrors(attrs)

  onRender: ->
    @stickit()
    @validateit()

  save: (e) ->
    e.preventDefault()

    if @model.isValid(true)
      @model.save null,
        success: =>
          @collection.add @model
          App.router.navigate("/#{@model.id}", trigger: true)
        error: (post, jqXHR) =>
          @showErrors $.parseJSON(jqXHR.responseText).errors
