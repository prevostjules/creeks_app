class AddCategoryToCreeks < ActiveRecord::Migration[6.0]
  def change
    add_column :creeks, :category, :string
  end
end
