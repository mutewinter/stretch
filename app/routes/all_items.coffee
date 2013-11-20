module.exports = App.AllItemsRoute = Ember.Route.extend
  model: ->
    @get('store').findAll('product').then (products) =>
      Ember.RSVP.all(products.invoke('get', 'items')).then (allItems) =>
        allItems.forEach (items) =>
          @controllerFor('all_items').pushObjects items.toArray()
