# frozen_string_literal: true

Sequel.migration do
  up do
    create_table(:your_table) do
      Integer :id
      String :name, null: false
      String :description
    end
  end

  down do
    drop_table(:your_table)
  end
end
