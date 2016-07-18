class User < ActiveRecord::Base
  # instead of including the BCrypt module just use BCrypt in your method so that you can use its functionality without thinking of your user as a BCrypt object.

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  # Need to fix naming conflict, but it breaks when I do.
  def authenticate(password, email)
    self.password == password && self.email == email
  end
end
