require 'serializers/sprintly'

module.exports = App.ProductSerializer = App.SprintlySerializer.extend
  extractArray: (store, primaryType, payload, recordId, requestType) ->
    payload.forEach (product) ->
      product.links =
        items: "/api/products/#{product.id}/items"
    newPayload = products: payload
    @_super(store, primaryType, newPayload, recordId, requestType)
