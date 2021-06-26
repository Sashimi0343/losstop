class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :name, :president, :profile, :city, :address, :image
  end

  validates :phone, numericality: { only_integer: true, message: 'は半角数字で入力してください。' },
                    length: { maximum: 11, message: 'は11桁以内で入力してください。' }
  validates :prefecture_id, numericality: { other_than: 0, message: 'を選択してください。' }

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は、半角の英数字両方を使用してください。' }

  has_one_attached :image
  belongs_to :prefecture

  with_options dependent: :destroy do
    has_many :bazaars
    has_many :order_bazaars
    has_many :contact_bazaars
    has_many :review_bazaars

    has_many :order_auctions
    has_many :contact_auctions
    has_many :review_auctions
  end
end
