express = require 'express'
router = new express.Router()

mongoose = require 'mongoose'

router.post '/', (req, res) ->
  res.json req.body

module.exports = router
