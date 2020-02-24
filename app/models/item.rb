class Item < ApplicationRecord
  # has_many :photos, dependent: :destroy
  belongs_to :category
  belongs_to :saler
  belongs_to :buyer
end
