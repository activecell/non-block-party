express = require 'express'
router = new express.Router()

mongoose = require 'mongoose'
Standup = mongoose.model 'Standup'

HIPCHAT_API = process.env.HIPCHAT_API
HIPCHAT_ROOM = process.env.HIPCHAT_ROOM

if HIPCHAT_API and HIPCHAT_ROOM
  hipchat = new require('node-hipchat')(process.env.HIPCHAT_API)


router.get '/standups', (req, res) ->
  Standup.find().sort('-timestamp').exec (err, standups) ->
    res.json standups: standups

router.post '/standups', (req, res) ->
  return res.json {} unless req.body and req.body.standup
  { status, today, tomorrow, standup, questions, user } = req.body.standup
  standup = new Standup { status, today, tomorrow, standup, questions, user }
  standup.save()

  if hipchat
    hipchat.postMessage
      room: HIPCHAT_ROOM
      color: status.toLowerCase()
      message: 'New standup posted by: ' + user

  res.json 201, standup

router.get '/standups/status', (req, res) -> process.exit 0

module.exports = router
