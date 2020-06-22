class AddUserNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :access_token, :string
    add_column :users, :role, :integer
  end
end
