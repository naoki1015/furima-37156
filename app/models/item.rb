class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :deadline
  belongs_to :prefecture
  belongs_to :shopping_charge
  belongs_to :status
  has_one_attached :image

  validates :name, :explanation, presence: true

  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is invalid' }

  validates :image, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :deadline_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shopping_charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" }
end
