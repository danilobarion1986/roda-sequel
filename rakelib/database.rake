# frozen_string_literal: true

require_relative '../config/application'
Sequel.extension :migration

desc 'Tasks relacionadas ao banco de dados'
namespace :db do
  desc 'Realiza o setup do banco de dados (roda migrations e popula com os dados do seeds)'
  task :setup do
    Rake::Task['db:migrate'].execute
    Rake::Task['db:seed'].execute
  rescue => e
    puts "Erro => #{e.message}"
  end

  desc 'Roda as migrations pendentes'
  task :migrate do

    Sequel::Migrator.run(DB, "#{APP_ROOT}/db/migrations")
  rescue Sequel::Migrator::Error => e
    puts "Erro => #{e.message}"
  end

  desc 'Popula o banco de dados'
  task :seed do

    Db::Seeds.call
  rescue => e
    puts "Erro => #{e.message}"
  end
end
