class Business < ApplicationRecord
  belongs_to :category
  has_many :products
  has_one_attached :cover
  has_one_attached :logo
end
