class Item < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true
  has_many_attached :photos

  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  validates :photos, presence: true,length:{ minimum: 1} 

  validates :name, presence: true
  validates :text, presence: true, length:{ maximum: 1000}
  validates :status, presence: true
  validates :shipping_charges, presence: true
  validates :shipping_area, presence: true
  validates :days_to_ship, presence: true
  validates :price, presence: true,numericality: { only_integer: true, reater_than: 300, less_than: 9999999}, format:{ with:/\A[0-9]+\z/ }
  validates :category_id, presence: true
  validates :saler_id, presence: true

end
