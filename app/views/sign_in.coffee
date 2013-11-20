ViewTargetActionSupport = Ember.ViewTargetActionSupport

module.exports = App.SignInView = Ember.View.extend ViewTargetActionSupport,
  templateName: 'sign_in'

  submit: (event) ->
    event.preventDefault()
    @triggerAction
      action: 'saveCredentials',
      actionContext:
        username: @get('controller.username')
        apiKey: @get('controller.apiKey')
