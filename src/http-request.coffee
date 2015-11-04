_ = require 'lodash'
CallbackComponent = require 'nanocyte-component-callback'

class HttpRequest extends CallbackComponent
  constructor: (options, dependencies={}) ->
    {@request} = dependencies
    @request ?= require 'request'
    super

  onEnvelope: (envelope, callback) =>
    message = _.defaults timeout: 30, envelope.message
    @request message, (error, response) =>
      return callback error if error?
      callback null, _.pick(response, 'body', 'statusCode')

module.exports = HttpRequest
