Tastethispicture.ApplicationRoute = Ember.Route.extend

  model: (params)->
    $.getJSON("/photo-stream", page: 1)

  setupController: (controller, model)->
    controller.set "model", model
