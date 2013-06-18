express = require 'express'
router = new express.Router()

mongoose = require 'mongoose'

router.get '/', (req, res) ->
  res.json hello: 'world'

module.exports = router
