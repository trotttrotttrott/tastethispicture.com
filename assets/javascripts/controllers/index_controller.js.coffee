Tastethispicture.IndexController = Ember.ArrayController.extend

  getPhotos: ->

    @set "isLoading", true

    @set "page", (@get("page") + 1)

    $.getJSON "/pictures", page: @get("page"), (data) =>
      data = $.parseJSON(data).photos
      @set "total", data.total
      @set "pages", data.pages
      @set "perPage", data.perpage
      @set "page", data.page
      @get("model").addObjects(data.photo)

      @set "isLoading", false
