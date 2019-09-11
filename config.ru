# frozen_string_literal: true

require_relative './config/application'

use Rack::Reloader, 0
$LOAD_PATH.unshift('.')
run App.freeze.app
