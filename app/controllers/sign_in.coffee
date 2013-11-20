module.exports = App.SignInController = Ember.ObjectController.extend
  username: Ember.computed.alias 'currentUser.username'
  apiKey: Ember.computed.alias 'currentUser.apiKey'
