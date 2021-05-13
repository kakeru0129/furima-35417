class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block_number, :building_name, :phone_number, :order_id, :user_id, :item_id

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :block_number
    validates :phone_number
  end

  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block_number: block_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end