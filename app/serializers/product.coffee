require 'serializers/sprintly'

module.exports = App.ProductSerializer = App.SprintlySerializer.extend
  extractSingle: (store, primaryType, payload, recordId, requestType) ->
    payload.links =
      items: "/api/products/#{payload.id}/items"
    newPayload = product: payload
    @_super(store, primaryType, newPayload, recordId, requestType)

  extractArray: (store, primaryType, payload, recordId, requestType) ->
    payload.forEach (product) ->
      product.links =
        items: "/api/products/#{product.id}/items"
    newPayload = products: payload
    @_super(store, primaryType, newPayload, recordId, requestType)
