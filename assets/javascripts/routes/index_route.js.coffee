Tastethispicture.IndexRoute = Ember.Route.extend

  model: (params)->
     []

  setupController: (controller, model) ->
    controller.set "model", model
    controller.set "page", 0
    controller.getPhotos()
