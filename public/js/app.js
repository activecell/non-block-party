;(function(e,t,n){function i(n,s){if(!t[n]){if(!e[n]){var o=typeof require=="function"&&require;if(!s&&o)return o(n,!0);if(r)return r(n,!0);throw new Error("Cannot find module '"+n+"'")}var u=t[n]={exports:{}};e[n][0](function(t){var r=e[n][1][t];return i(r?r:t)},u,u.exports)}return t[n].exports}var r=typeof require=="function"&&require;for(var s=0;s<n.length;s++)i(n[s]);return i})({1:[function(require,module,exports){
(function() {
  var routes, standup, store;

  module.exports = window.App = Ember.Application.create();

  App.status = {
    content: ['Green', 'Yellow', 'Red']
  };

  store = require('./store.coffee');

  standup = require('./models/standup.coffee');

  routes = require('./routes.coffee');

}).call(this);


},{"./store.coffee":2,"./models/standup.coffee":3,"./routes.coffee":4}],2:[function(require,module,exports){
(function() {
  var App;

  App = require('./application.coffee');

  App.Adapter = DS.RESTAdapter.extend({
    serializer: DS.RESTSerializer.extend({
      primaryKey: function() {
        return '_id';
      }
    })
  });

  DS.RESTAdapter.reopen({
    namespace: 'api/v1'
  });

  App.Store = DS.Store.extend({
    revision: 13,
    adapter: 'App.Adapter'
  });

  module.exports = App.Store;

}).call(this);


},{"./application.coffee":1}],3:[function(require,module,exports){
(function() {
  var App;

  App = require('../application.coffee');

  App.Standup = DS.Model.extend({
    status: DS.attr('string'),
    today: DS.attr('string'),
    tomorrow: DS.attr('string'),
    questions: DS.attr('string'),
    user: DS.attr('string')
  });

  module.exports = App.Standup;

}).call(this);


},{"../application.coffee":1}],4:[function(require,module,exports){
(function() {
  var App;

  App = require('./application.coffee');

  App.Router.map(function() {
    this.resource('index', {
      path: '/'
    });
    return this.resource('updates', {
      path: '/updates'
    });
  });

  App.IndexController = Ember.Controller.extend({
    submit: function() {
      var form, standup,
        _this = this;
      form = this.getProperties("status", "today", "tomorrow", "questions", "user");
      console.log(form);
      standup = App.Standup.createRecord(form);
      return standup.save().then(function() {
        return _this.transitionToRoute('updates');
      });
    }
  });

  App.UpdatesRoute = Ember.Route.extend({
    model: function() {
      return App.Standup.find();
    }
  });

}).call(this);


},{"./application.coffee":1}]},{},[1])
;