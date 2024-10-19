class Product < ApplicationRecord
  belongs_to :business
  has_one_attached :image
  has_and_belongs_to_many :categories

  validate :validate_product_limit

  validates :image, presence: true
  validates :name, presence: true
  validates :presentation, presence: true
  validates :price, presence: true

  def images_validation
    if images.attached?
      images.each do |image|
        if image.byte_size > 5.megabyte
          errors.add(:Foto, ": debe ser menor de 5MB") and return
        end
      end
    end
  end

  before_validation :set_default_category, on: :create
  before_save :set_default_category


  

  private

    def set_default_category
      if categories.empty?
        uncategorized_category = Category.find_by(name: 'Sin Categorizar')
        self.category_ids = [uncategorized_category.id] if uncategorized_category
      end
    end

    def validate_product_limit
      return unless self.business
      return unless new_record?
      if self.business.products.count >= 4
        errors.add(:base, "Se ha alcanzado el límite máximo de productos para este negocio. Puedes eliminar uno de tus productos antiguos y sustituirlo por uno nuevo")
      end
    end
end
