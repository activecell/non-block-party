express = require 'express'
router = new express.Router()

mongoose = require 'mongoose'
Standup = mongoose.model 'Standup'

router.get '/', (req, res) ->
  res.render 'index'

router.post '/', (req, res) ->
  res.json req.body

router.get '/updates', (req, res) ->
  Standup.find (err, standups) ->
    res.render 'updates', { standups }

module.exports = router
