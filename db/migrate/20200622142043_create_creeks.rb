class CreateCreeks < ActiveRecord::Migration[6.0]
  def change
    create_table :creeks do |t|
      t.string :title
      t.text :description
      t.string :scheduledStartTime
      t.float :price
      t.integer :capacity
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
