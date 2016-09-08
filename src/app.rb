require 'json'
require 'router'

class App

  def call(env)
    Router.new(env).response.formatted
  end

end
