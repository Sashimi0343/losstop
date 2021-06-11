class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name
    validates :president
    validates :profile
    validates :phone, numericality: { only_integer: true, message: '電話番号は半角数字で入力してください。' }
    validates :city
    validates :address
  end

  validates :prefecture_id, numericality: { other_than: 0, message: '都道府県を選択してください。' }

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は、半角の英数字両方を使用してください。' }

  belongs_to :prefecture
#  has_many :order_bazaars
#  has_many :reviews
#  has_many :contact_bazaars
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/, message: 'は、全角「漢字・ひらがな・カタカナ」で入力してください。' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/, message: 'は、全角「漢字・ひらがな・カタカナ」で入力してください。' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は、全角カタカナで入力してください。' }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は、全角カタカナで入力してください。' }
    validates :birthday
  end

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は、半角の英数字両方を使用してください。' }

#  has_many :order_bazaars
#  has_many :reviews
#  has_many :contact_bazaars
end
