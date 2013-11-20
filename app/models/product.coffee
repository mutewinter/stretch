module.exports = App.Product = DS.Model.extend
  name: DS.attr('string')
  items: DS.hasMany('item', async: true)

  displayName: (->
    @get('name').replace(/OAMM\s?/g, '')
  ).property('name')
