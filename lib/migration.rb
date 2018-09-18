class Migration
  def self.database_connection
    Sequel.postgres(
      host: 'postgres',
      user: 'workshop',
      password: 'secretpassword',
      database: 'workshop_one'
    )
  end

  def self.column_information(db, table='card')
    columns = db.fetch(
      "SELECT column_name, 
              data_type, 
              is_nullable, 
              identity_increment,
              ordinal_position
      FROM information_schema.columns
      WHERE table_name = '#{table}'" 
    ).all
  end

  def self.card_table_exists?(db)
    db.fetch(
      "SELECT * FROM pg_catalog.pg_tables 
      WHERE tablename = 'card'" 
    ).all
  end
end