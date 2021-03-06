# ===== Config =====
window.App = require 'config/app'
require 'config/router'
env = require 'config/environment'

# Load all modules in order automagically. Ember likes things to work this
# way so everything is in the App.* namespace.
folderOrder = [
  'initializers', 'utils', 'mixins', 'adapters', 'serializers', 'routes',
  'models', 'views', 'controllers', 'helpers', 'templates', 'components'
]

folderOrder.forEach (folder) ->
  # Go through the prefixes in order and require them
  window.require.list().filter((module) ->
    new RegExp("^#{folder}/").test(module)
  ).forEach((module) -> require(module))


if env.get('isDevelopment')
  App.ApplicationAdapter = DS.FixtureAdapter
else
  App.ApplicationAdapter = App.SprintlyAdapter
  App.ApplicationSerializer = App.SprintlySerializer
