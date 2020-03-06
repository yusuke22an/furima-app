class Item < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true
  has_many_attached :photos
end
