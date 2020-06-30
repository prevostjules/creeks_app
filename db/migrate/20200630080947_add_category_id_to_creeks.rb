class AddCategoryIdToCreeks < ActiveRecord::Migration[6.0]
  def change
    add_reference :creeks, :category, foreign_key: true
  end
end
