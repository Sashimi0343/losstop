class ReviewAuction < ApplicationRecord

  with_options presence: true do
    validates :comment, :name
  end

  belongs_to :auction
  belongs_to :user, optional: true
  belongs_to :company, optional: true
end
