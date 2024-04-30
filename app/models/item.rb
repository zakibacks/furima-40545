class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :product_name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :product_condition_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_price_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_area_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_date_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300,
                                                    less_than_or_equal_to: 9_999_999,
                                                    message: 'must be between ¥300 and ¥9,999,999' }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :delivery_price
  belongs_to :delivery_area
  belongs_to :delivery_date
end
