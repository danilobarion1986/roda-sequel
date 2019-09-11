# frozen_string_literal: true

Sequel.migration do
  up do
    alter_table(:beneficios) do
      add_column :valor, Integer
    end
  end

  down do
    alter_table(:beneficios) do
      drop_column :valor
    end
  end
end
