module.exports = App.ApplicationRoute = Ember.Route.extend
  actions:
    didTransition: ->
      if env.get('isProduction') and !Ember.isNone(_gauges)
        Ember.run.scheduleOnce 'afterRender', -> _gauges.push(['track'])
