App = require './application.coffee'

App.Adapter = DS.RESTAdapter.extend
  serializer: DS.RESTSerializer.extend
    primaryKey: -> '_id'

DS.RESTAdapter.reopen
  namespace: 'api/v1'

App.Store = DS.Store.extend
  revision: 13
  adapter: 'App.Adapter'

module.exports = App.Store
