class AddAskToBecomeStreamerToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :ask_to_become_streamer, :boolean, default: false
  end
end
