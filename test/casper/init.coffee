# You should run this before running the casper test suite.
# Be careful! This will drop the entire local 'sand' mongodb database

mongoose = require 'mongoose'

MONGO_URI = 'mongodb://localhost/sand'

connection = mongoose.connect MONGO_URI, (err) ->
  throw err if err

connection.connection.db.dropDatabase()

setTimeout ->
  process.exit 0
, 2000