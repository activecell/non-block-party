express = require 'express'
router = new express.Router()

mongoose = require 'mongoose'
Standup = mongoose.model 'Standup'

router.get '/standups', (req, res) ->
  Standup.find().sort('-timestamp').exec (err, standups) ->
    res.json standups: standups

router.post '/standups', (req, res) ->
  return res.json {} unless req.body and req.body.standup
  standup = new Standup req.body.standup
  standup.save()
  res.json standup

module.exports = router
