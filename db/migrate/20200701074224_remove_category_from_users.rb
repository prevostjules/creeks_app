class RemoveCategoryFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :users, :categories
  end
end
