USERNAME_KEY = 'sprintly_username'
API_KEY_KEY = 'sprintly_api_key'

module.exports = App.CurrentUserController = Ember.ObjectController.extend

  username: ((key, value)->
    if arguments.length > 1
      localStorage.setItem(USERNAME_KEY, value)

    localStorage.getItem(USERNAME_KEY)
  ).property()

  apiKey: ((key, value)->
    if arguments.length > 1
      localStorage.setItem(API_KEY_KEY, value)

    localStorage.getItem(API_KEY_KEY)
  ).property()

  hasCredentials: (->
    !(Ember.isEmpty(@get('username')) and Ember.isEmpty(@get('apiKey')))
  ).property('username', 'apiKey')
