module.exports = App.ProductsRoute = Ember.Route.extend
  model: ->
    @get('store').findAll('product')
