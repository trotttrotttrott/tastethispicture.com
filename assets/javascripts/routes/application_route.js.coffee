Tastethispicture.ApplicationRoute = Ember.Route.extend

  model: (params)->
    {}

  setupController: (controller, model)->
    controller.set "model", model
