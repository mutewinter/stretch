module.exports = App.Product = DS.Model.extend
  name: DS.attr('string')
  archived: DS.attr('boolean')
  items: DS.hasMany('item', async: true)

  displayName: (->
    @get('name').replace(/OAMM\s?/g, '')
  ).property('name')

App.Product.FIXTURES = [
  {
    id: 1
    name: 'Herp Derp'
    items: ['1-1', '1-2', '1-3', '1-4']
  }
  {
    id: 2
    name: 'Derpy Herp'
    items: []
  }
  {
    id: 3
    name: 'Duderp'
    items: []
  }
  {
    id: 4
    name: 'Archived Product'
    items: []
    archived: true
  }
]
