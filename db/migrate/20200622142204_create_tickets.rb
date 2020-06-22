class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.references :creek, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :payment_status, default: false

      t.timestamps
    end
  end
end
