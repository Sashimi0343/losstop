class CreateReviewBazaars < ActiveRecord::Migration[6.0]
  def change
    create_table :review_bazaars do |t|
      t.string :name, null: false
      t.text :comment, null: false
      t.references :bazaar, null: false, foreign_key: true
      t.references :company, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
