Ember.Application.initializer
  name: 'current_user'

  initialize: (container, application) ->
    application.register(
      'user:current', App.CurrentUserController, singleton: true
    )
    application.inject('controller', 'currentUser', 'user:current')
    application.inject('route', 'currentUser', 'user:current')
    application.inject('adapter', 'currentUser', 'user:current')
