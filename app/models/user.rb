class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cards 
  has_many :items
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A\S+@\S+\.\S+\z/ }
  validates :password, presence: true, length: { minimum: 7}
  validates :password_confirmation, presence: true
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name_furigana, presence: true, format: { with: /\A[ぁ-んー－]+\z/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_furigana, presence: true, format: { with: /\A[ぁ-んー－]+\z/ }
  validates :year_of_birth, presence: true, length: { maximum: 4}
  validates :month_of_birth, presence: true, length: { maximum: 2}
  validates :day_of_birth, presence: true, length: { maximum: 2}
  validates :delivery_last_name, presence: true
  validates :delivery_first_name, presence: true
  validates :zip, presence: true,  length: { maximum: 8}
  validates :prefectures, presence: true
  validates :municipality, presence: true
  validates :address, presence: true
end
