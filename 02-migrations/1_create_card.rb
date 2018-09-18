Sequel.migration do
  change do
    create_table :card do
      primary_key :id
      Integer :number, null: false
    end
  end
end
