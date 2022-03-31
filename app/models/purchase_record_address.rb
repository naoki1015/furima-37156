class PurchaseRecordAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipality, :house_number, :building, :phone_number, :purchase_record_id

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
    # 各テーブルにデータを保存する処理を書く
  end
end