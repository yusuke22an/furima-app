class Item < ApplicationRecord
  # has_many :photos, dependent: :destroy
  belongs_to :category
  belongs_to :saler
  belongs_to :buyer
  has_many_attached :photos, dependent: :destroy
  # accepts_nested_attributes_for :photos
end
