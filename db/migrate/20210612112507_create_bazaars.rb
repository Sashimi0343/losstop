class CreateBazaars < ActiveRecord::Migration[6.0]
  def change
    create_table :bazaars do |t|
      t.string     :title,               null: false
      t.text       :description,         null: false
      t.integer    :price,               null: false
      t.integer    :stock,               null: false
      t.date       :deadline,            null: false
      t.string     :active,              nill: false
      t.integer    :category_id,         null: false
      t.integer    :delivery_charge_id,  null: false
      t.references :company,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
