module.exports = App.SignInRoute = Ember.Route.extend
  actions:
    saveCredentials: (credentials) ->
      @controllerFor('current_user').setProperties(credentials)
      @transitionTo('all_items')
