class CreateContactAuctions < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_auctions do |t|

      t.text :message, null: false
      t.references :order_auction, null: false, foreign_key: true
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true
      t.timestamps
    end
  end
end
