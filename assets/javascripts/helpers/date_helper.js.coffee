Ember.Handlebars.helper "date", (value, options) ->
  moment(value).format("MMMM M, YYYY")
