# frozen_string_literal: true

require_relative '../config/base'

desc 'Tasks relacionadas ao banco de dados'
namespace :db do
  migrations_path = "#{APP_ROOT}/db/migrations"
  user = ENV['POSTGRES_USER']
  db = ENV['POSTGRES_DB']

  desc 'Cria o banco de dados para o ambiente informado'
  task :create do
    system("docker exec -ti roda_db psql -U #{user} -c 'CREATE DATABASE #{db};'")
  end

  desc 'Exclui o banco de dados para o ambiente informado'
  task :drop do
    system("docker exec -ti roda_db psql -U #{user} -c 'DROP DATABASE #{db};'")
  rescue StandardError => e
    puts "Erro => #{e.message}"
  end

  desc 'Executa todas as migrations pendentes. Caso seja informado o parâmetro "true", ignora os arquivos de migrations que estejam faltando'
  task :migrate, [:ignore_missing] do |_t, args|
    require_relative '../config/sequel'
    Sequel.extension :migration

    extra_params = { allow_missing_migration_files: args[:ignore_missing] }.compact
    Sequel::Migrator.run(DB, migrations_path, extra_params)
  rescue Sequel::Migrator::Error => e
    puts "Erro => #{e.message}"
  end

  desc 'Reinicia o banco de dados, rodando o bloco "down" de todas as migrations'
  task :reset do
    require_relative '../config/sequel'
    Sequel.extension :migration

    Sequel::Migrator.run(DB, migrations_path, target: 0)
  rescue Sequel::Migrator::Error => e
    puts "Erro => #{e.message}"
  end

  desc 'Popula o banco de dados com o arquivo "db/seeds.rb"'
  task :seed do
    require_relative '../config/sequel'

    Db::Seeds.call
  rescue StandardError => e
    puts "Erro => #{e.message}"
  end

  desc 'Realiza o setup do banco de dados (migrate && seed)'
  task :setup do
    Rake::Task['db:drop'].execute
    Rake::Task['db:create'].execute
    Rake::Task['db:migrate'].execute
    Rake::Task['db:seed'].execute
  rescue StandardError => e
    puts "Erro => #{e.message}"
  end
end
