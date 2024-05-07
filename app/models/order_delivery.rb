class OrderDelivery
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :order, :postal_code, :delivery_area_id, :area, :house_number, :building_name, :number, :token

  with_options presence: true do
    validates :postal_code,      format: { with: /\A\d{3}-\d{4}\z/ }
    validates :delivery_area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :area
    validates :house_number
    validates :number, numericality: { only_integer: true }, length: { minimum: 10, maximum: 11 }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    delivery = Delivery.create(postal_code: postal_code, delivery_area_id: delivery_area_id, area: area, house_number: house_number,
                               building_name: building_name, number: number, order_id: order.id)
  end
end
