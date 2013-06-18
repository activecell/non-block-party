express = require 'express'
router = new express.Router()

mongoose = require 'mongoose'
Standup = mongoose.model 'Standup'

router.get '/standups', (req, res) ->
  Standup.find().sort('-timestamp').exec (err, standups) ->
    res.json standups: standups

router.post '/standups', (req, res) ->
  standup = new Standup req.body
  standup.save()
  res.json standup

module.exports = router
