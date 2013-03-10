class App.module('Views.Posts').Show extends Backbone.Marionette.ItemView
  template: 'posts/show'

  bindings:
    '#title': 'title'
    '#content': 'content'
    
  onRender: ->
    @stickit()
