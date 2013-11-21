env = require 'config/environment'

Ember.Application.initializer
  name: 'version_check'

  initialize: (container, application) ->
    if env.get('isProduction')
      Ember.$.get('/signature').then (response) ->
        Ember.run -> application.set('originalSignature', response)
        setInterval(->
          Ember.$.get('/signature').then (response) ->
            hasNewVersion = response != application.get('originalSignature')
            application.set('hasNewVersion', hasNewVersion)
        , 10000)
