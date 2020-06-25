class AddIdBroadcastToCreeks < ActiveRecord::Migration[6.0]
  def change
    add_column :creeks, :IdBroadcast, :string
  end
end
