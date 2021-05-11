class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :area
  belongs_to :day

  with_options presence: true do
    validates :title
    validates :description
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :area_id
    validates :day_id
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :area_id
    validates :day_id
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}

  validates :price, format: { with: /\A[0-9]+\z/, message: '半角数字で入力してください' }
  
end
