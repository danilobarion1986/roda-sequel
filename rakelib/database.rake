# frozen_string_literal: true

require_relative '../config/base'

desc 'Database related tasks'
namespace :db do
  migrations_path = "#{APP_ROOT}/db/migrations"

  desc 'Create the database for given environment'
  task :create do
    require 'sequel'

    config = CONNECTION_OPTIONS.dup
    config[:database] = 'master'

    Sequel.connect(config) do |db|
      database_name = "your_database_#{ENV['RACK_ENV'] || :development}"
      db.execute "CREATE DATABASE #{database_name}"
    end
  end

  desc 'Drop entire database for given environment'
  task :drop do
    require_relative '../config/sequel'

    Sequel::Model.db.disconnect
    config = Sequel::Model.db.opts
    database_name = "[#{config[:database]}]"
    DB.execute "USE MASTER; DROP DATABASE #{database_name}"
  end

  desc 'Run all pending migrations. If you pass `true` to :ignore_missing parameter, it ignores missing migration files'
  task :migrate, [:ignore_missing] do |t, args|
    require_relative '../config/sequel'
    Sequel.extension :migration

    extra_params = { allow_missing_migration_files: args[:ignore_missing] }.compact
    Sequel::Migrator.run(DB, migrations_path, extra_params)
  rescue Sequel::Migrator::Error => e
    puts "Error => #{e.message}"
  end

  desc 'Reset database for its initial state, running the `down` block of all your migrations'
  task :reset do
    require_relative '../config/sequel'
    Sequel.extension :migration

    Sequel::Migrator.run(DB, migrations_path, target: 0)
  rescue Sequel::Migrator::Error => e
    puts "Error => #{e.message}"
  end

  desc 'Populate your database with the data contained in the "db/seeds.rb" file'
  task :seed do
    require_relative '../config/sequel'

    Db::Seeds.call
  rescue StandardError => e
    puts "Error => #{e.message}"
  end

  desc 'Run all migrations and populate your database with the data contained in the "db/seeds.rb" file'
  task :setup do
    Rake::Task['db:migrate'].execute
    Rake::Task['db:seed'].execute
  rescue StandardError => e
    puts "Error => #{e.message}"
  end
end
