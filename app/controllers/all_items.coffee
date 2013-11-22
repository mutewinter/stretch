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
      'Number'
      'Type'
      'Size'
      'Status'
      'Title'
      'Product'
      'Link'
    ]
    json.rows = @get('filteredContent').map (item) ->
      {
        Link: item.get('sprintlyUrl')
        Number: item.get('number')
        Product: item.get('product.displayName')
        Size: item.get('score')
        Status: item.get('status')
        Title: item.get('title')
        Type: item.get('type')
      }
    "data:text/csv;charset=utf-8,#{escape(csvjson.json2csv(json))}"
  ).property('filteredContent.@each')
