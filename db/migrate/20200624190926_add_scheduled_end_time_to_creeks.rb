class AddScheduledEndTimeToCreeks < ActiveRecord::Migration[6.0]
  def change
    add_column :creeks, :scheduledEndTime, :string
  end
end
