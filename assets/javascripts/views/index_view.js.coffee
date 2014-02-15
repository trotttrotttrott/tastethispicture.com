Tastethispicture.IndexView = Ember.View.extend

  didInsertElement: ->
    @listenToScroll()

  listenToScroll: ->
    $(window).on "scroll", =>
      @onScroll()

  onScroll: ->

    scrollTop = $(window).scrollTop()
    docHeight = $(document).height()
    winHeight = $(window).height()

    if scrollTop + winHeight + 400 > docHeight
      $(window).off "scroll"
      @get("controller").getPhotos =>
        @listenToScroll()
