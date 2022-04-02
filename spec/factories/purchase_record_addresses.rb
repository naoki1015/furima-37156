FactoryBot.define do
  factory :purchase_record_address do
    post_code { '123-4567' }
    prefecture_id { 3 }
    municipality { '守山市' }
    house_number { '1-1' }
    building { '東京ハイツ' }
    phone_number { '08020993076' }
  end
end
