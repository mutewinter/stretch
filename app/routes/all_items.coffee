module.exports = App.AllItemsRoute = Ember.Route.extend
  beforeModel: ->
    unless @controllerFor('currentUser').get('hasCredentials')
      @transitionTo('sign_in')

  setupController: (controller) ->
    controller.get('content').clear()
    @get('store').findAll('product').then (products) =>
      controller.set('products', products)
      Ember.RSVP.all(products.invoke('get', 'items')).then (allItems) =>
        allItems.forEach (items) =>
          controller.pushObjects items.toArray()
