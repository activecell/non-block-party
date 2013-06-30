mongoose = require("mongoose")
Schema = mongoose.Schema

UserSchema = new Schema
  githubId: type: Number, required: true
  accessToken: type: String, required: true
  accessTokenSecret: {}
  metadata: {}

# Set Mongoose Model
module.exports = mongoose.model "User", UserSchema
