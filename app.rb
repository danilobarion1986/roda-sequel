# frozen_string_literal: true

require_relative './config/application'

# Class with the routing tree
class App < Roda
  plugin :environments
  plugin :json, classes: [Array, Hash, Sequel::Model]
  plugin :symbol_matchers
  plugin :error_handler
  plugin :status_handler
  plugin :hooks
  plugin :slash_path_empty

  after do |res|
    if defined?(@start_time)
      request_time = clock_time - @start_time
      puts "[request_time] => #{request_time.round(5)} ms"
    end

    Airbrake.notify_request(
      method: request.env['REQUEST_METHOD'],
      route: request.matched_path,
      status_code: response.status,
      start_time: Time.now
    )
  end
  error do |e|
    Airbrake.notify(e)
    { error: e.message }
  end
  status_handler(403) do
    'Forbidden'
  end
  status_handler(404) do
    'Not Found'
  end

  configure :development, :test do
    require 'pry'
    require 'awesome_print'
    plugin :exception_page
  end

  route do |r|
    r.root do
      r.redirect '/healthcheck'
    end

    # route: GET /healthcheck
    r.is 'healthcheck' do
      Domain::Healthcheck.call
    end

    r.on 'v1' do
      r.on 'domain' do
        # route: GET /v1/domain/:domain_id
        r.get :d do |domain_id|
          notify_request do
            { domain: domain_id }
          end
        end

        r.is do
          # route: GET /v1/domain
          r.get do
            @start_time = clock_time
            { domain: {} }
          end
        end
      end
    end
  end

  def clock_time
    Process.clock_gettime(Process::CLOCK_MONOTONIC)
  end
end
