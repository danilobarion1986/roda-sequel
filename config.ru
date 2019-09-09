# frozen_string_literal: true

use Rack::Reloader, 0
$LOAD_PATH.unshift('.')

require 'dotenv'
Dotenv.load(".env.#{ENV['RACK_ENV'] || :development}")

require 'app'
run App.freeze.app
