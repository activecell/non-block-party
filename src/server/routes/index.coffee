express = require 'express'
router = new express.Router()

mongoose = require 'mongoose'
Standup = mongoose.model 'Standup'

router.get '/', (req, res) ->
  loggedIn = !!req.session.auth?.userId

  res.render 'index',
    csrf: req.session._csrf
    loggedIn: loggedIn
    user: if loggedIn then req.session.auth.github.user.login else ''

router.get '/logout', (req, res) ->
  req.session.destroy()
  res.redirect '/'

module.exports = router
