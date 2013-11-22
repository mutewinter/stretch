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

  csvDownloadFilename: (->
    d = new Date
    "stretch_export_#{d.getFullYear()}_#{d.getMonth()+1}_#{d.getDate()}.csv"
  ).property()

  csvData: (->
    json = { }
    json.headers = [
      'Size'
      'Link'
      'Title'
      'Product'
      'Status'
    ]
    json.rows = @get('filteredContent').map (item) ->
      {
        Size: item.get('score')
        Link: item.get('sprintlyUrl')
        Title: item.get('title')
        Product: item.get('product.displayName')
        Status: item.get('status')
      }
    "data:text/csv;charset=utf-8,#{escape(csvjson.json2csv(json))}"
  ).property('filteredContent.@each')
