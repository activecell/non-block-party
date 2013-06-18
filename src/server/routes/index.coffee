express = require 'express'
router = new express.Router()

mongoose = require 'mongoose'
Standup = mongoose.model 'Standup'

router.get '/', (req, res) ->
  res.render 'index'

router.post '/', (req, res) ->
  standup = new Standup req.body
  standup.save()
  res.redirect '/updates'

router.get '/updates', (req, res) ->
  Standup.find().sort('-timestamp').exec (err, standups) ->
    res.render 'updates', { standups }

module.exports = router
