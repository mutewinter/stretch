module.exports = App.Router.map ->
  @resource 'products', path: '/'
  @resource 'product', path: '/product/:product_id'
  @resource 'all_items', path: '/all-items'
