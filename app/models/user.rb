class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, length: { minimum: 6 }
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  validates :first_name, presence: true
  validates :last_name, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  with_options presence: true, format: { with: /\A[ァ-ヶ一]+\z/, message: '全角文字を使用してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end
  validates :birthday, presence: true

  has_many :items
  has_many :orders

end
