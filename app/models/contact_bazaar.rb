class ContactBazaar < ApplicationRecord
  with_options presence: true do
    validates :message, :name
  end

  has_many :notice_companys, dependent: :destroy

  belongs_to :order_bazaar
  belongs_to :user, optional: true
  belongs_to :company, optional: true


  def create_notice_contact(current_company, contact_bazaar_id, user_id)

    temp_ids = ContactBazaar.select(user_id).where(order_bazaar_id: id).where.not(company_id: current_company.id)
    temp_ids.each do |temp_id|
      save_notice_contact!(current_company, contact_bazaar_id, temp_id['user_id'])
    end
    save_notice_contact!(current_company, contact_bazaar_id, user_id) if temp_ids.blank?
  end

  def save_notice_contact(current_company, contact_bazaar_id, visited_company_id)
    notice = current_company.active_notice.new(
      bazaar_id: id,
      contact_bazaar_id: contact_bazaar_id,
      visited_id: visited_id,
      action: 'contact'
    )

    if notice.visitor_id == notice.visited_id
      notice.checked = true
    end
    notice.save if notice.valid?
  end
end
