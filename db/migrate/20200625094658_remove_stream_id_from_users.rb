class RemoveStreamIdFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :stream_id, :string
  end
end
