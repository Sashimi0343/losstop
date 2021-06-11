class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions

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