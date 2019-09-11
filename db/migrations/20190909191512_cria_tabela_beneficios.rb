# frozen_string_literal: true

Sequel.migration do
  up do
    create_table(:beneficios) do
      Integer :id
      String :nome, null: false
      String :descricao
      TrueClass :ativo, null: false, default: true
    end

    alter_table(:beneficios) do
      add_index :id, name: :IDX_beneficio_id, unique: true
      add_index :nome, name: :IDX_beneficio_nome, unique: true
    end
  end

  down do
    drop_table(:beneficios)
  end
end
