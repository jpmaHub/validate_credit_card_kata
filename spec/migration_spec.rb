require 'migration'

describe Migration do
  it 'can load the migration extension' do
    Sequel.extension :migration
    expect(Sequel::Migrator).not_to be_nil
  end

  it 'can create the card number table' do
    migration_directory = "./02-migrations"
    database_connection = Migration.database_connection
  
    Sequel::Migrator.run(database_connection, migration_directory, target: 1)

    expect(
      database_connection[:schema_info].first
    ).to(
      eq(version: 1)
    )
    
    expect(
      Migration.card_table_exists?(database_connection)
    ).to be_truthy
  
    columns = Migration.column_information(
      database_connection
    )
  
    expect(columns.length).to eq(2), 'there should be two columns'
  
    first_column = columns[0]
    expect(first_column[:column_name]).to eq('id')
    expect(first_column[:data_type]).to eq('integer')
    expect(first_column[:is_nullable]).to eq('NO')
    expect(first_column[:identity_increment]).to eq('1')
    expect(first_column[:ordinal_position]).to eq(1)
  
    second_column = columns[1]
    expect(second_column[:column_name]).to eq('number')
    expect(second_column[:data_type]).to eq('integer')
    expect(second_column[:is_nullable]).to eq('NO')
    expect(second_column[:identity_increment]).to be_nil
    expect(second_column[:ordinal_position]).to eq(2)
  
    database_connection.disconnect
  end
  
end 