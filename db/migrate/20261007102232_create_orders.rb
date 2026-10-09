class CreateOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.integer :quantity, null: false, default: 1
      t.integer :unit_price_cents, null: false
      t.string :status, null: false, default: "pending"

      t.timestamps
    end
  end
end
