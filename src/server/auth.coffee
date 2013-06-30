everyauth = require 'everyauth'
_ = require 'underscore'
mongoose = require 'mongoose'

User = mongoose.model 'User'

github = require 'github'
github = new github { version: '3.0.0' }

{ GITHUB_ID, GITHUB_SECRET, GITHUB_ORG } = process.env

# Leave if we don't have any environment variables for Github auth
unless GITHUB_ID and GITHUB_SECRET and GITHUB_ORG
  throw new Error """
    No Github info specified in environment variables.
    Need GITHUB_ID, GITHUB_SECRET, and GITHUB_ORG (case sensitive)
  """

everyauth.everymodule.findUserById (userId, callback) ->
  User.findById userId, callback

everyauth.github
  .appId(GITHUB_ID)
  .appSecret(GITHUB_SECRET)
  .findOrCreateUser((session, accessToken, accessTokenSecret, metadata) ->
    promise = @Promise()
    githubId = metadata.id

    userObj = { accessToken, accessTokenSecret, metadata, githubId }

    User.findOne { githubId, accessToken }, (err, user) ->
      return promise.fail err if err
      return createNewUser userObj, promise unless user

      promise.fulfill user

    return promise
  ).redirectPath('/')

createNewUser = (obj, promise) ->
  user = new User obj

  github.authenticate
    type: "oauth"
    username: obj.metadata.login
    token: obj.accessToken

  github.user.getOrgs {}, (err, data) ->
    return promise.fail err if err

    orgs = _.pluck data, 'login'

    if orgs.indexOf(GITHUB_ORG) is -1
      return promise.fail new Error("User is not a member of this organization")

    user.save()
    promise.fulfill user
