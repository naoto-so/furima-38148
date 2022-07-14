class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_number, :send_area_id, :city, :address_number, :building, :tel, :order_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :send_area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address_number
    validates :tel, format: {with: /\d{10,11}/}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_number: post_number, send_area_id: send_area_id, city: city,
       address_number: address_number, building: building, tel: tel, order_id: order.id)
  end
end