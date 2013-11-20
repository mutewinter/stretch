module.exports = App.SignInController = Ember.ObjectController.extend
  username: Ember.computed.oneWay 'currentUser.username'
  apiKey: Ember.computed.oneWay 'currentUser.apiKey'
