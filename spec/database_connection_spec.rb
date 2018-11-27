require "database_connection"
require 'pg'

describe DatabaseConnection do
  let(:database_connection) {DatabaseConnection.new}

  it "creates an instance of the DatabaseConnection object" do
    expect(database_connection.instance_of? DatabaseConnection).to eq true
  end
  it "setups a database connection to bookmark_manager_test" do
    expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
    DatabaseConnection.setup("bookmark_manager_test")
  end
  it "runs a SQL command on a database connection to bookmark_manager_test" do
    connection = DatabaseConnection.setup("bookmark_manager_test")
    expect(connection).to receive(:exec).with("SELECT * FROM bookmarks")
    DatabaseConnection.query("SELECT * FROM bookmarks")
  end

end
