class Category < ApplicationRecord
  has_many :businesses, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true
  validates :description, presence: true
  validates :icon, presence: true
  validates :photo, presence: true
end
