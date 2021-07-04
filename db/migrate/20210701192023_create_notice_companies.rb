class CreateNoticeCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :notice_companies do |t|

      t.integer :visitor_user_id, null: false
      t.integer :visited_company_id, null: false

      t.integer :order_bazaar_id
      t.integer :contact_bazaar_id
      t.integer :bazaar_id
      t.integer :review_bazaar_id

      t.integer :order_auction_id
      t.integer :contact_auction_id

      t.string :action, default: '', null: false
      t.boolean :checked, default: false, null: false
      t.timestamps
    end

    add_index :notice_companies, :visitor_user_id
    add_index :notice_companies, :visited_company_id

    add_index :notice_companies, :order_bazaar_id
    add_index :notice_companies, :contact_bazaar_id
    add_index :notice_companies, :bazaar_id
    add_index :notice_companies, :review_bazaar_id


    add_index :notice_companies, :order_auction_id
    add_index :notice_companies, :contact_auction_id
  end
end
