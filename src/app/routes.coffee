App = require './application.coffee'

#App.Router.reopen
# location: 'history'

App.Router.map ->
  @resource 'index', path: '/'
  @resource 'updates', path: '/updates'

App.IndexController = Ember.Controller.extend
  submit: ->
    form = @getProperties("today", "tomorrow", "questions", "user")
    form.status = App.status.value
    standup = App.Standup.createRecord form
    # Save and then redirect to Updates
    standup.save().then => @transitionToRoute 'updates'

App.UpdatesRoute = Ember.Route.extend
  model: -> App.Standup.find()
