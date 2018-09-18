require 'sequel'
# require 'pg'
require 'connection'

database_connection = nil

describe 'Connection' do

  it 'can create connection' do
    database_connection = Sequel.connect('postgres://workshop:secretpassword@postgres:5432/workshop_one')

    o = INeedADatabaseConnection.new(
      database: database_connection
    )
    expect(o.query_data).to eq([{ one: 1 }])
  end

  it 'can disconnect a connection' do
    database_connection.disconnect

    number_of_connections = `netstat -atp | grep ESTABLISHED | wc -l`.chomp
    expect(number_of_connections.to_i).to eq(0)
  end
end