class AddStreamNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :stream_name, :string
  end
end
