require 'minitest/autorun'
require 'minitest/mock'

# loading
$LOAD_PATH.unshift(File.expand_path('../../src', __FILE__))

ENV['RACK_ENV'] = "test"

require 'app'
require 'rack'
require 'time'

# helper methods can go here or in a new file
