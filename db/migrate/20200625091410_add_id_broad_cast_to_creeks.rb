class AddIdBroadCastToCreeks < ActiveRecord::Migration[6.0]
  def change
    add_column :creeks, :id_broadcast, :string
  end
end
