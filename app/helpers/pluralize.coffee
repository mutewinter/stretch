Ember.Handlebars.helper 'pluralize', (numberOrArray, singular, options) ->
  count = if Ember.isArray(numberOrArray)
    Ember.get(numberOrArray, 'length')
  else
    numberOrArray
  if count == 1 then singular else singular.pluralize()
