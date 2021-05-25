class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :block_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code
    validates :area_id
    validates :city
    validates :block_number
    validates :phone_number
    validates :token
    validates :user_id
    validates :item_id
  end

  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "をハイフンありで入力してください"}
  validates :area_id, numericality: { other_than: 1, message:"を選択してください" }
  validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "をハイフンなしで入力してください"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, area_id: area_id, city: city, block_number: block_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end