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
    validates :city
    validates :address
  end

  validates :phone, numericality: { only_integer: true, message: 'は半角数字で入力してください。' },
                      length: { maximum: 11, message: 'は11桁以内で入力してください。' }
  validates :prefecture_id, numericality: { other_than: 0, message: 'を選択してください。' }

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は、半角の英数字両方を使用してください。' }

  has_one_attached :image

  belongs_to :prefecture
  has_many :bazaars, dependent: :destroy
  has_many :contact_bazaars, dependent: :destroy
  has_many :review_bazaars, dependent: :destroy

  has_many :order_auctions, dependent: :destroy
  has_many :contact_auctions, dependent: :destroy
  has_many :review_auctions, dependent: :destroy
end
