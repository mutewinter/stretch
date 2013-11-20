module.exports = App.AllItemsRoute = Ember.Route.extend
  setupController: (controller) ->
    @get('store').findAll('product').then (products) =>
      controller.set('products', products)
      Ember.RSVP.all(products.invoke('get', 'items')).then (allItems) =>
        allItems.forEach (items) =>
          controller.pushObjects items.toArray()
