class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 has_many :items
 has_many :purchase_records


 with_options presence: true do
  validates :nickname
  validates :email
  validates :encrypted_password
  validates :last_name
  validates :first_name
  validates :last_name_kana
  validates :first_name_kana
  validates :birthday
 end
 
end
