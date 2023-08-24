class Business < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :user, optional: true

  has_many :products, dependent: :destroy
  has_one_attached :cover
  has_one_attached :logo

  validates :cover, presence: true
  validates :logo, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :rif, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :location, presence: true
  
end
