class CreateNoticeCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :notice_companies do |t|

      t.integer :visitor_user_id, null: false
      t.integer :visited_company_id, null: false
      t.integer :contact_bazaars_id
      t.integer :review_bazaars_id
      t.integer :contact_auctions_id
      t.integer :review_auctions_id
      t.string :action, default: '', null: false
      t.boolean :checked, default: false, null: false
      t.timestamps
    end

    add_index :notice_companies, :visitor_user_id
    add_index :notice_companies, :visited_company_id
    add_index :notice_companies, :contact_bazaars_id
    add_index :notice_companies, :review_bazaars_id
    add_index :notice_companies, :contact_auctions_id
    add_index :notice_companies, :review_auctions_id
  end
end
