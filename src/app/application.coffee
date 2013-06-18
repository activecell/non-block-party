module.exports = window.App = Ember.Application.create()

# Bootstrap store
store = require './store.coffee'
# Bootstrap models
standup = require './models/standup.coffee'
# Bootstrap routes
routes = require './routes.coffee'
