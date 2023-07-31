class Business < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :user, optional: true
  has_many :products, dependent: :destroy
  has_one_attached :cover
  has_one_attached :logo
end
