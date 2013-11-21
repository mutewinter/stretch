module.exports = App.Product = DS.Model.extend
  name: DS.attr('string')
  items: DS.hasMany('item', async: true)

  displayName: (->
    @get('name').replace(/OAMM\s?/g, '')
  ).property('name')

App.Product.FIXTURES = [
  {
    id: 1
    name: 'Herp Derp'
    items: ['1-1']
  }
]
