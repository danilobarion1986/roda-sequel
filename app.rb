# frozen_string_literal: true

require 'roda'
require 'awesome_print'
require 'json'
require 'pathname'

# Roda's routing tree
class App < Roda
  plugin :environments

  # path to your application root.
  APP_ROOT = Pathname.new(File.expand_path(__dir__))

  route do |r|
    # GET / request
    r.root do
      r.redirect '/healthcheck'
    end

    r.is 'healthcheck' do
      { status: :ok }.to_json
    end

    r.on 'v1/beneficios' do
      ap matched: r.matched_path, remaining: r.remaining_path
      { hello: :danilo }.to_json
    end
  end
end
