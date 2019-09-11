# frozen_string_literal: true

require_relative '../config/application'
Sequel.extension :migration

desc 'Tasks relacionadas ao banco de dados'
namespace :db do
  desc 'Roda as migrations pendentes'
  task :migrate do

    Sequel::Migrator.run(DB, "#{APP_ROOT}/db/migrations")
  rescue Sequel::Migrator::Error => e
    puts "Erro #{e.message}"
  end
end
