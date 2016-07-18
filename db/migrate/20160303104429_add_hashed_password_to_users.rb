class AddHashedPasswordToUsers < ActiveRecord::Migration
  def change
    add_column    :users, :hashed_password, :string
    remove_column :users, :password
  end
end
