# frozen_string_literal: true

require 'sequel'
require 'pathname'

desc 'Tasks relacionadas ao banco de dados'
namespace :db do
  desc 'Roda as migrations pendentes'
  task :migrate do
    conn = <<~CONNECTION
      postgres://#{ENV['DATABASE_USER']}:#{ENV['DATABASE_PASSWORD']}@#{ENV['DATABASE_HOST']}:#{ENV['DATABASE_PORT']}/#{ENV['DATABASE_DB']}
    CONNECTION

    # path to your application root.
    APP_ROOT = Pathname.new(File.expand_path('..', __dir__))

    system("sequel -m #{File.join(APP_ROOT, 'db', 'migrations')} #{conn}")
  end
end
