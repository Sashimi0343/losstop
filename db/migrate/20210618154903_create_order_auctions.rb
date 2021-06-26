class CreateOrderAuctions < ActiveRecord::Migration[6.0]
  def change
    create_table :order_auctions do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :quantity, null: false
      t.references :auction, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.timestamps
    end
  end
end
