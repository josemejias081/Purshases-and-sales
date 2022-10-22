class Category < ApplicationRecord
  has_many :businesses, dependent: :destroy
  has_one_attached :photo
end
