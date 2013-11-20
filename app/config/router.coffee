module.exports = App.Router.map ->
  @resource 'all_items', path: '/'
  @resource 'sign_in', path: '/sign_in'
