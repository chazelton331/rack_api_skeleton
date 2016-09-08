require 'test_helper'

class RouterTest < Minitest::Test

  def test_unsupported_response
    assert_equal(Handlers::Unsupported, Router.new("REQUEST_PATH" => "/api/asdljfasklf").response.class)
  end

  # ping
  def test_ping_response_post
    assert_equal(Handlers::Unsupported, Router.new("REQUEST_METHOD" => "POST", "REQUEST_PATH" => "/ping").response.class)
  end

  def test_ping_response_get
    assert_equal(Handlers::Ping, Router.new("REQUEST_METHOD" => "GET", "REQUEST_PATH" => "/ping").response.class)
  end

  # post params
  def test_post_params_parsing
    post_body  = StringIO.new.tap do |strio|
      strio.puts "{ \"some_key\": \"some_value\" }\n"
      strio.rewind
    end

    router = Router.new("REQUEST_METHOD" => "POST", "REQUEST_PATH" => "/whatever", "rack.input" => Rack::Lint::InputWrapper.new(post_body))

    assert_equal({ "some_key" => "some_value" }, router.instance_variable_get(:@params))
  end

  def test_get_params_parsing
    post_body  = StringIO.new.tap do |strio|
      strio.puts "{ \"some_key\": \"some_value\" }\n"
      strio.rewind
    end

    router = Router.new("REQUEST_METHOD" => "GET", "REQUEST_PATH" => "/whatever", "rack.input" => Rack::Lint::InputWrapper.new(post_body))

    assert_equal(nil, router.instance_variable_get(:@params))
  end

end
