# frozen_string_literal: true

Sequel.migration do
  up do
    create_table(:beneficios) do
      primary_key :id
      String :nome, null: false
      String :descricao
      TrueClass :ativo, null: false, default: true
    end
  end

  down do
    drop_table(:beneficios)
  end
end
