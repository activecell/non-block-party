App = require '../application.coffee'

App.Standup = DS.Model.extend
  # Red, Yellow, or Green
  status: DS.attr 'string'
  # What did you work on today?
  today: DS.attr 'string'
  # What do you plan to work on tomorrow?
  tomorrow: DS.attr 'string'
  # What barriers, questions, or issues are you facing?
  questions: DS.attr 'string'
  #timestamp: DS.attr 'date'
  # This field will store a user id which will be populated on query
  # Once we implement the users model, we'll use this schema type:
  # { type: Schema.Types.ObjectId, ref: 'User' }
  user: DS.attr 'string'
  becameError: ->
    alert "You're not logged in! Please login to submit a standup."

module.exports = App.Standup
