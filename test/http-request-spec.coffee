CallbackComponent = require 'nanocyte-component-callback'
HttpRequest = require '../src/http-request'

describe 'HttpRequest', ->
  beforeEach ->
    @request = sinon.spy()
    @sut = new HttpRequest {}, request: @request

  it 'should exist', ->
    expect(@sut).to.be.an.instanceOf CallbackComponent

  describe '->onEnvelope', ->
    describe 'when called with an envelope', ->
      beforeEach ->
        @callback = sinon.spy (@error) =>
        @sut.onEnvelope {message: {url: 'anything'}}, @callback

      it 'should call request', ->
        expect(@request).to.have.been.calledWith url: 'anything', timeout: 30

      describe 'when request yields', ->
        beforeEach ->
          @request.yield null, body: '{"valid": "json"}', statusCode: 200, foo: 'bar'

        it 'should call the callback with helpful response attributes', ->
          expect(@callback).to.have.been.calledWith null, body: '{"valid": "json"}', statusCode: 200

      describe 'when request yields an error', ->
        beforeEach ->
          @request.yield new Error

        it 'should call the callback with an error', ->
          expect(@error).to.exist
