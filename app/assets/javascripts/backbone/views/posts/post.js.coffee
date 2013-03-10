class App.module('Views.Posts').Post extends Backbone.Marionette.ItemView
  tagName: "tr"
  template: 'posts/post'
  events:
    "click .destroy" : "destroy"

  destroy: (e)->
    e.preventDefault()
    @model.destroy()

  bindings:
    '#title': 'title'
    '#content': 'content'

  onRender: ->
    @stickit()
