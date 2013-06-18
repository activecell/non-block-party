App = require './application.coffee'

App.Store = DS.Store.extend
  revision: 13
  adapter: DS.RESTAdapter

DS.RESTAdapter.extend
  serializer: DS.RESTSerializer.extend
    primaryKey: (type) -> '_id'

DS.RESTAdapter.reopen
  namespace: 'api/v1'

module.exports = App.Store
