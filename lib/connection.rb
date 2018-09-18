class INeedADatabaseConnection
  def initialize(database:)
    @database = database
  end

  def query_data
    @database.fetch('SELECT 1 as one').all
  end
end
