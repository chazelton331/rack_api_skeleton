require 'test_helper'

class Handlers::UnsupportedTest < Minitest::Test

  def test_body
    assert_equal({ error: true, message: "Unsupported request" }, Handlers::Unsupported.new.body)
  end

  def test_code
    assert_equal(400, Handlers::Unsupported.new.code)
  end

end
