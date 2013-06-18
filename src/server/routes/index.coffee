express = require 'express'
router = new express.Router()

mongoose = require 'mongoose'
Standup = mongoose.model 'Standup'

router.get '/', (req, res) ->
  res.render 'index'

module.exports = router
