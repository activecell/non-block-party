module.exports = window.App = Ember.Application.create()

# Bootstrap statuses for template <select> rendering
App.status =
  content: ['Green', 'Yellow', 'Red']


# Bootstrap store
store = require './store.coffee'
# Bootstrap models
standup = require './models/standup.coffee'
# Bootstrap routes
routes = require './routes.coffee'
