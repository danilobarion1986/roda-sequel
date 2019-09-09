# frozen_string_literal: true

# Classe responsável por conexões com o banco de dados
class Database
  attr_reader :conn

  def initialize(config_filename = :database, extension = :yml)
    @conn = ::Sequel.connect(File.join(App::APP_ROOT, 'config', "#{config_filename}.{extension}"))
  end

  def execute(statement, parameters)
    params = secure_parameters(parameters || [])
    conn.execute("#{statement}(#{params})", &:to_a)
  end

  def close_connection
    @conn.disconnect
  end

  private

  def secure_parameters(parameters)
    parameters.map { |param| conn.literal(param.to_s) }.join(',')
  end
end
