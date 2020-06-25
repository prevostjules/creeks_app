class AddStreamIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :stream_id, :string
  end
end
