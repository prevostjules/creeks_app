class AddDurationToCreeks < ActiveRecord::Migration[6.0]
  def change
    add_column :creeks, :duration, :integer
  end
end
