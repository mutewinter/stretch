module.exports = App.ItemRowView = Ember.View.extend
  tagName: 'tr'
  classNameBindings: ['context.rowClass']
  templateName: 'item_row'
