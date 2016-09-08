require 'test_helper'

class AppTest < Minitest::Test

  def setup
    @app = App.new
    @env = { "REQUEST_PATH" => "/ping", "REQUEST_METHOD" => "GET" }
  end

  def test_call_invokes_the_router_response
    expected_response = [
      "200",
      { "Content-Type"=>"application/json" },
      [ "{\"message\":\"ok\"}" ]
    ]

    assert_equal(expected_response, @app.call(@env))
  end

  private
end
