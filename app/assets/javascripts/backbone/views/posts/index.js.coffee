class App.module('Views.Posts').Index extends Backbone.Marionette.CompositeView
  template: 'posts/index'
  itemViewContainer: 'tbody'

  buildItemView: (item, ItemViewType, itemViewOptions)->
    new App.Views.Posts.Post(_.extend({model: item}, itemViewOptions))
