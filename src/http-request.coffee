ReturnValue = require 'nanocyte-component-return-value'

class HttpRequest extends ReturnValue
  onEnvelope: (envelope) =>
    return envelope.message

module.exports = HttpRequest
