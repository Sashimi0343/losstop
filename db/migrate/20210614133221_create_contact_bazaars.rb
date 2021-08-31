class CreateContactBazaars < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_bazaars do |t|
      t.string     :name,           null: false
      t.text       :message,        null: false
      t.references :order_bazaar,   null: false, foreign_key: true
      t.references :company,        foreign_key: true
      t.references :user,           foreign_key: true
      t.timestamps
    end
  end
end
