App = require './application.coffee'

App.Router.map ->
  @resource 'index', path: '/'
  @resource 'updates', path: '/updates'

App.UpdatesRoute = Ember.Route.extend
  model: -> App.Standup.find()
