express = require 'express'
router = new express.Router()

mongoose = require 'mongoose'
Standup = mongoose.model 'Standup'

HIPCHAT_API = process.env.HIPCHAT_API
HIPCHAT_ROOM = process.env.HIPCHAT_ROOM

if HIPCHAT_API and HIPCHAT_ROOM
  hipchat = new require('hipchat')(HIPCHAT_API)

router.get '/standups', (req, res) ->
  Standup.find().sort('-timestamp').exec (err, standups) ->
    res.json standups: standups

router.post '/standups', (req, res) ->
  return res.json 401, { err: 'No Standup' } unless req.body and req.body.standup
  return res.json 401, { err: 'Not logged in' } unless req.session.auth?.github?.user?.login

  { status, today, tomorrow, standup, questions } = req.body.standup

  user = req.session.auth.github.user.login
  standup = new Standup { status, today, tomorrow, standup, questions, user }
  standup.save()

  if hipchat?.Rooms
    message = """
    <a href="http://github.com/#{user}">#{user}</a> has posted a <a href="http://nonblockparty.com/#/updates">new standup<a/>.
    <br>
    - Today: #{today}
    <br>
    - Tomorrow: #{tomorrow}
    <br>
    - Questions: #{questions}
    <br>
    """
    hipchat.Rooms.message HIPCHAT_ROOM, 'Non-Block Party', message,
      color: status.toLowerCase()

  res.json 201, standup

router.get '/standups/status', (req, res) -> process.exit 0

module.exports = router
