# frozen_string_literal: true

require 'yaks/interactor'
require 'minitest/autorun'

class Middleware < Yaks::Interactor::Middleware
  def call
    receiver.data << 'middleware before'
    result = app.call
    receiver.data << 'middleware after'
    result
  end
end

class Interactor
  extend Yaks::Interactor

  use Middleware

  def initialize
    @data = []
  end

  attr_reader :data

  def call
    data << 'interactor'
    'result'
  end
end

class UnitTest < Minitest::Test
  def setup
    @interactor = Interactor.new
  end

  def test_interactor_returns_correct_result
    assert_equal @interactor.call, 'result'
  end

  def test_middlewares_work_correctly
    @interactor.call
    assert_equal @interactor.data, ['middleware before', 'interactor', 'middleware after']
  end
end
