# frozen_string_literal: true

Sequel.migration do
  change do
    create_table :card do
      primary_key :id
      String :number, null: false
    end
  end
end
