class CreateOrderBazaars < ActiveRecord::Migration[6.0]
  def change
    create_table :order_bazaars do |t|

      t.integer :quantity, null: false
      t.references :bazaar, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
