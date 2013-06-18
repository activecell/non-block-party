express = require 'express'
http = require 'http'
path = require 'path'
fs = require 'fs'
mongoose = require 'mongoose'
Mongo_Store = require('connect-mongo')(express)
PORT = process.env.PORT || 3000
MONGO_URI = 'mongodb://localhost/embers'

mongoose.connect MONGO_URI, (err) ->
  throw err if err

# Bootstrap models
modelsPath = __dirname + '/models'
fs.readdirSync(modelsPath).forEach (file) ->
  require "#{modelsPath}/#{file}"

# Remove this and app.use forceSSL below if you do not want SSL enabled
forceSSL = (req, res, next) ->
  return next() if process.env.NODE_ENV is "development" or req.headers["x-forwarded-proto"] is "https"
  # Redirect to https
  res.redirect 301, "https://" + req.headers.host + req.path

app = express()

app.configure ->
  app.set "port", PORT
  app.set "views", "#{__dirname}/views"
  app.set "view engine", "jade"
  #app.use forceSSL
  app.use express.favicon()
  app.use express.logger("dev")
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.cookieParser()
  app.use express.session
    secret: 'what would you like'
    store: new Mongo_Store
      url: MONGO_URI
  app.use app.router
  app.use require('./routes').middleware
  #app.use '/api/v1', require('./routes/api').middleware
  app.use express.static(path.join(__dirname, '..', '..', "public"))
  app.use (req, res) ->
    # catch all to redirect to ember app
    res.redirect 301, "/##{req.url}"

# Infinite stack trace
Error.stackTraceLimit = Infinity

app.configure "development", ->
  app.use express.errorHandler()

http.createServer(app).listen(app.get('port'))
