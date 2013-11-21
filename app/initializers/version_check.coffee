Ember.Application.initializer
  name: 'version_check'

  initialize: (container, application) ->
    Ember.$.get('/sha').then (response) ->
      Ember.run -> application.set('originalSha', response)
      setInterval(->
        Ember.$.get('/sha').then (response) ->
          hasNewVersion = response != application.get('originalSha')
          application.set('hasNewVersion', hasNewVersion)
      , 10000)
