class App.Models.Post extends Backbone.Model
  urlRoot: '/posts'
  paramRoot: 'post'

  defaults:
    title: null
    content: null

  validation:
    content:
      required: true

  toJSON: ->
    id: @id
    title: @get('title')
    content: @get('content')

class App.Collections.Posts extends Backbone.Collection
  model: App.Models.Post
  url: '/posts'
