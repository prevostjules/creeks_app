class RemoveCategoryFromCreeks < ActiveRecord::Migration[6.0]
  def change
    remove_column :creeks, :category
  end
end
