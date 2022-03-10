FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { 'test1234' }
    password_confirmation { password }
    last_name             { '山田' }
    last_name_kana        { 'ヤマダ' }
    first_name            { '太朗' }
    first_name_kana       { 'タロウ' }
    birthday              { '1988-01-01' }
  end
end
