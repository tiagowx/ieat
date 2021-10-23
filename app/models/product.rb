class Product < ApplicationRecord
  belongs_to :restaurant
  has_many :order

  validates :name, presence: true
end
