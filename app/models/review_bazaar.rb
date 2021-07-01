class ReviewBazaar < ApplicationRecord
  with_options presence: true do
    validates :comment, :name
  end

  has_many :notice_companies, dependent: :destroy

  belongs_to :bazaar
  belongs_to :user, optional: true
  belongs_to :company, optional: true
end
