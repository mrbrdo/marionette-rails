class App.module('Views.Posts').Edit extends Backbone.Marionette.ItemView
  template: 'posts/edit'

  events:
    "submit #edit-post" : "update"

  bindings:
    '#title': 'title'
    '#content': 'content'

  initialize: ->
    @listenTo @model, 'validated', (_, __, attrs)=> @showErrors(attrs)

  onRender: ->
    @stickit()
    @validateit()
    
  update: (e) ->
    e.preventDefault()

    @model.save null,
      success: =>
        App.router.navigate("/#{@model.id}", trigger: true)
      error: (post, jqXHR) =>
        @showErrors $.parseJSON(jqXHR.responseText).errors
