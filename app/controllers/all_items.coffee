module.exports = App.AllItemsController = Ember.ArrayController.extend
  sortProperties: ['sizeWeight', 'id']
  notEmpty: Ember.computed.gt 'length', 0
