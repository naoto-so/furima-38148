class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :send_area
  belongs_to :send_day
  has_one_attached :image
  has_one :order

  validates :item_name,   presence: true
  validates :explanation, presence: true
  validates :image,       presence: true

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :send_area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :send_day_id, numericality: { other_than: 1, message: "can't be blank" }

  with_options presence: true, format: { with: /\A\d+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end
