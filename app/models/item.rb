class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :deadline
  belongs_to :prefecture
  belongs_to :shopping_charge
  belongs_to :status

  validates :name, :explanation, :price, presence: true


  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :deadline_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shopping_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
end
