module.exports = App.SprintlyAdapter = DS.RESTAdapter.extend
  namespace: 'api'

  ajaxOptions: (url, type, hash) ->
    options = @_super(arguments...)
    options.beforeSend = (request) ->
      request.setRequestHeader('Sprintly-User', @get('currentUser.username'))
      request.setRequestHeader('Sprintly-Api-Key', @get('currentUser.apiKey'))
    options
