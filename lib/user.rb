require_relative "./database_connection.rb"
require 'bcrypt'

class User
  attr_reader :email, :id
  def initialize(email, id)
    @email = email
    @id = id
  end

  def self.create(email, password)
    puts password = BCrypt::Password.create(password)
    result = DatabaseConnection.query(("INSERT INTO Users (email, password) VALUES('#{email}', '#{password}') RETURNING user_id, email;"))
    User.new(result[0]['email'], result[0]['user_id'])
  end
  def self.already_exists?(email_address)
    result = DatabaseConnection.query("SELECT * FROM Users WHERE email = '#{email_address}'")
    result.any?
  end
end
