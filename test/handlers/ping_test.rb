require 'test_helper'

class Handlers::PingTest < Minitest::Test

  def test_body
    assert_equal({ message: "ok" }, Handlers::Ping.new.body)
  end

  def test_code
    assert_equal(200, Handlers::Ping.new.code)
  end

end
