App = require './application.coffee'
standups = null

#App.Router.reopen
# location: 'history'

App.Router.map ->
  @resource 'index', path: '/'
  @resource 'updates', path: '/updates'

App.UpdatesRoute = Ember.Route.extend
  model: -> standups ?= App.Standup.find()
  setupController: (controller, standups) ->
    controller.set 'standups', standups
