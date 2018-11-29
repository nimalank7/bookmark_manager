require_relative "./database_connection.rb"

class User
  attr_reader :email, :password, :id
  def initialize(email, password, id)
    @email = email
    @password = password
    @id = id
  end

  def self.create(email, password)
    result = DatabaseConnection.query(("INSERT INTO Users (email, password) VALUES('#{email}', '#{password}') RETURNING user_id, email, password;"))
    User.new(result[0]['email'], result[0]['password'], result[0]['user_id'])
  end
end
