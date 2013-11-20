module.exports = App.AllItemsController = Ember.ArrayController.extend
  sortProperties: ['status']
  observesItems: (->
    @get('products').forEach((product) =>
      product.get('items').then (items) =>
        Ember.Logger.debug 'pushing', items.get('length')
        @pushObjects items.toArray()
    , [])
  ).observes('products.@each.items')
