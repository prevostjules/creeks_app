class RemoveStreamName3FromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :stream_name, :string
  end
end
