class NoticeCompany < ApplicationRecord

  default_scope -> { order(created_at: :desc) }
  belongs_to :contact_bazaar, optional: true
  belongs_to :review_bazaar, optional: true

  belongs_to :contact_auction, optional: true
  belongs_to :review_auction, optional: true


  belongs_to :visitor, class_name: 'user', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'company', foreign_key: 'visited_id', optional: true

end
