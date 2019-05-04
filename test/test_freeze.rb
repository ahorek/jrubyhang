# frozen_string_literal: true

require 'minitest/autorun'
require 'concurrent'

module TestDefinition
  def test(name, &block)
    define_method("test_#{name.inspect}", &block)
  end
end

class TestCase < MiniTest::Test
  extend TestDefinition
end
  
class TestManifest < TestCase
  test 'jruby freeze' do
    promise = Concurrent::Promise.execute(executor: :fast) do
      puts 'execute'
    end
    promise.wait!

    nil
  end
end
