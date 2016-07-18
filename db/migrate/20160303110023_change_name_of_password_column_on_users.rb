class ChangeNameOfPasswordColumnOnUsers < ActiveRecord::Migration
  def change
    add_column    :users, :password_hash, :string
    remove_column :users, :hashed_password
  end
end
