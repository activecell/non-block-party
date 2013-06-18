{ Schema } = mongoose = require 'mongoose'

standupSchema = new Schema
  # Red, Yellow, or Green
  status: String
  # What did you work on today?
  today: String
  # What do you plan to work on tomorrow?
  tomorrow: String
  # What barriers, questions, or issues are you facing?
  questions: String
  timestamp: { type: Date, default: Date.now }
  # This field will store a user id which will be populated on query
  # Once we implement the users model, we'll use this schema type:
  # { type: Schema.Types.ObjectId, ref: 'User' }
  user: String

Standup = mongoose.model 'Standup', standupSchema
