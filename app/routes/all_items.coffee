module.exports = App.AllItemsRoute = Ember.Route.extend
  model: ->
    @get('store').findAll('product')

  setupController: (controller, model) ->
    controller.set('products', model)
