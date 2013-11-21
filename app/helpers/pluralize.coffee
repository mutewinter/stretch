Ember.Handlebars.helper 'pluralize', (count, singular, options) ->
  if count is 1 then singular else singular.pluralize()
