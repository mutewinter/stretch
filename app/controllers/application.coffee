module.exports = App.ApplicationController = Ember.Controller.extend
  isSignedIn: Ember.computed.oneWay 'currentUser.hasCredentials'
