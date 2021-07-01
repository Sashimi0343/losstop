class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/, message: 'は、全角「漢字・ひらがな・カタカナ」で入力してください。' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/, message: 'は、全角「漢字・ひらがな・カタカナ」で入力してください。' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は、全角カタカナで入力してください。' }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は、全角カタカナで入力してください。' }
    validates :birthday
  end

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は、半角の英数字両方を使用してください。' }

  with_options dependent: :destroy do
    has_many :active_notice_companys, class_name: 'notice_company', foreign_key: 'visitor_user_id'

    has_many :order_bazaars
    has_many :contact_bazaars
    has_many :review_bazaars

    has_many :auctions
    has_many :order_auctions
    has_many :contact_auctions
    has_many :review_auctions
  end
end
