class AddStreamId3ToCreeks < ActiveRecord::Migration[6.0]
  def change
    add_column :creeks, :stream_id, :string
  end
end
