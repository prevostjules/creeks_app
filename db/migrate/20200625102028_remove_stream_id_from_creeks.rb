class RemoveStreamIdFromCreeks < ActiveRecord::Migration[6.0]
  def change
    remove_column :creeks, :stream_id, :string
  end
end
