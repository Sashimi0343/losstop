class CreateAuctions < ActiveRecord::Migration[6.0]
  def change
    create_table :auctions do |t|

      t.string     :title,               null: false
      t.text       :description,         null: false
      t.integer    :price,               null: false
      t.integer    :stock,               null: false
      t.integer    :category_id,         null: false
      t.integer    :delivery_charge_id,  null: false
      t.integer    :days_to_ship_id,     null: false
      t.references :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end