class RemoveScheduledEndTimeFromCreeks < ActiveRecord::Migration[6.0]
  def change
    remove_column :creeks, :scheduledEndTime, :string
  end
end
