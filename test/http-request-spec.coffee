ReturnValue = require 'nanocyte-component-return-value'
HttpRequest = require '../src/http-request'

describe 'HttpRequest', ->
  beforeEach ->
    @sut = new HttpRequest

  it 'should exist', ->
    expect(@sut).to.be.an.instanceOf ReturnValue

  describe '->onEnvelope', ->
    describe 'when called with an envelope', ->
      it 'should return the message', ->
        expect(@sut.onEnvelope({message: 'anything'})).to.deep.equal 'anything'
