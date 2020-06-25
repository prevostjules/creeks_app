class RemoveIdBroadcastFromCreeks < ActiveRecord::Migration[6.0]
  def change
    remove_column :creeks, :IdBroadcast, :string
  end
end
