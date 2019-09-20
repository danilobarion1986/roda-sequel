# frozen_string_literal: true

require 'airbrake'
require 'airbrake-ruby'
require 'newrelic-roda'

Airbrake.configure do |c|
  c.workers = ENV['AIRBRAKE_WORKERS'].to_i
  c.project_id = ENV['AIRBRAKE_PROJECT_ID']
  c.project_key = ENV['AIRBRAKE_API_KEY']
  c.environment = ENV['RACK_ENV']
  c.app_version = TAG
  c.root_directory = APP_ROOT
  c.performance_stats = true
  c.ignore_environments = %i[test development]
end

Airbrake.add_performance_filter do |resource|
  resource.ignore! if resource.route == '/healthcheck'
end

at_exit do
  # https://github.com/airbrake/airbrake-ruby#reporting-critical-exceptions
  Airbrake.notify_sync($!) if $!
end
