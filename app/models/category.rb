class Category < ApplicationRecord
  has_many :businesses, dependent: :destroy
  has_one_attached :photo
  has_and_belongs_to_many :products, through: :categories_products

  validates :name, presence: true
  validates :description, presence: true
  validates :icon, presence: true
  validates :photo, presence: true

  ICONS = [
    ['Cámara', 'fas fa-camera'],
    ['Coche', 'fas fa-car'],
    ['Corazón', 'fas fa-heart'],
    ['Libro', 'fas fa-book'],
    ['Estrella', 'fas fa-star'],
    ['Cafetería', "fa-solid fa-mug-saucer"],
    ['Peluquería', 'fa-solid fa-scissors'].freeze
  ]
end
