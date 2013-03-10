_.extend Backbone.Model.prototype, Backbone.Validation.mixin
_.extend Backbone.View.prototype,
  validateit: ->
    Backbone.Validation.bind(this)

  showErrors: (errors)->
    @$('.error-msg').text('')
    if errors?
      Object.keys(errors).each (attr_name)=>
        msg = errors[attr_name]
        msg = msg.first() if Array.isArray(msg)

        selector = Object.keys(@bindings).find (selector)=>
          @bindings[selector] == attr_name
        if selector?
          @$(selector).next('.error-msg').text(msg)

Backbone.Marionette.Renderer.render = (template, data)->
  template = "backbone/templates/#{template}"
  throw "Template '#{template}' not found!" unless JST[template]?
  JST[template](data)