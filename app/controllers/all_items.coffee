ProductCheckbox = Ember.Object.extend
  isChecked: true

module.exports = App.AllItemsController = Ember.ArrayController.extend
  sortProperties: ['sizeWeight', 'id']
  notEmpty: Ember.computed.gt 'length', 0
  filteredProducts:
    Ember.computed.filterProperty 'productCheckboxes', 'isChecked'

  init: ->
    @_super()
    @set('filteredContent',
      Ember.ArrayController.create(
        sortProperties: ['sizeWeight', 'id']
        content: @get('content')
      )
    )

  productCheckboxes: (->
    @get('products').map (product) ->
      ProductCheckbox.create(product: product)
  ).property('products')

  observesChecked: (->
    checked = @get('productCheckboxes').filterBy('isChecked').mapBy('product')
    filteredContent = @get('content').filter (item) ->
      checked.contains(item.get('product'))
    @set('filteredContent.content', filteredContent)
  ).observes('productCheckboxes.@each.isChecked')
