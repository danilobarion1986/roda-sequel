# frozen_string_literal: true

require 'roda'
require 'pathname'
require 'zeitwerk'
require 'dry/schema'
require 'dotenv'
require 'pry'
require 'awesome_print'

Dotenv.load(".env.#{ENV['RACK_ENV'] || :development}")

APP_ROOT = Pathname.new(File.expand_path('..', __dir__))
TAG_VERSAO = File.readlines(File.join(APP_ROOT, 'versao')).first.chomp
CONNECTION_OPTIONS = {
  adapter: :tinytds,
  mode: :dblib,
  timeout: 180_000,
  username: ENV['DATABASE_USER'],
  password: ENV['DATABASE_PASSWORD'],
  host: ENV['DATABASE_HOST'],
  port: ENV['DATABASE_PORT'],
  database: ENV['DATABASE_DB']
}.freeze

# https://github.com/fxn/zeitwerk/blob/master/README.md
loader = Zeitwerk::Loader.new
loader.push_dir(APP_ROOT)
loader.enable_reloading
loader.setup # ready!
