class PurchaseRecordAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipality, :house_number, :building, :phone_number, :purchase_record_id ,:token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code
    validates :prefecture_id
    validates :municipality
    validates :house_number
    validates :phone_number
    validates :purchase_record_id
  end


  def save
    purchase_record = Purchase_record.create(user_id: user_id, item_id: item_id)

    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, house_number: house_number, building: building, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end