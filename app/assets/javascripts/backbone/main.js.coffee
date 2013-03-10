#= require_self
#= require ./core_ext
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require ./router

window.App = new Backbone.Marionette.Application

App.module 'Models'
App.module 'Collections'
App.module 'Views'
App.module 'Controllers'
App.module 'Routers'

App.addInitializer ->
  @addRegions(mainRegion: '#content')
  @router = new @Routers.Main(controller: new @Controllers.Main)

  $(document).on 'click', 'a', (e)->
    path = $(this).attr('href')
    if path.startsWith('/') && !$(this).data('reload')?
      e.preventDefault()
      App.router.navigate(path, trigger: true)

App.on 'initialize:after', ->
  Backbone.history.start(pushState: true) if Backbone.history?

$(document).ready ->
  App.start()