require 'serializers/sprintly'

module.exports = App.ItemSerializer = App.SprintlySerializer.extend
  extractArray: (store, primaryType, payload, recordId, requestType) ->
    payload.forEach (item) ->
      item.id = "#{item.product.id}-#{item.number}"
      item.product_id = item.product.id
      delete item.product
    newPayload = items: payload
    @_super(store, primaryType, newPayload, recordId, requestType)
