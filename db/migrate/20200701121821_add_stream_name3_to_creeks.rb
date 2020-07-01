class AddStreamName3ToCreeks < ActiveRecord::Migration[6.0]
  def change
    add_column :creeks, :stream_name, :string
  end
end
