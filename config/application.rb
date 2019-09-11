# frozen_string_literal: true

require 'roda'
require 'pathname'
require 'dotenv'
Dotenv.load(".env.#{ENV['RACK_ENV'] || :development}")

# path to your application root.
APP_ROOT = Pathname.new(File.expand_path('..', __dir__))
DATABASE_URL = "postgres://#{ENV['DATABASE_USER']}:#{ENV['DATABASE_PASSWORD']}@#{ENV['DATABASE_HOST']}:#{ENV['DATABASE_PORT']}/#{ENV['DATABASE_DB']}"

require 'sequel'
DB = Sequel.connect(DATABASE_URL)
# https://sequel.jeremyevans.net/rdoc-plugins/classes/Sequel/Plugins/JsonSerializer.html
Sequel::Model.plugin :json_serializer

require 'pry'
require 'awesome_print'

require_relative '../app'

