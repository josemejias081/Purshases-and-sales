class Product < ApplicationRecord
  belongs_to :business, optional: true
  has_one_attached :image
  validate :validate_product_limit

  def images_validation
    if images.attached?
      images.each do |image|
        if image.byte_size > 5.megabyte
          errors.add(:Foto, ": debe ser menor de 5MB") and return
        end
      end
    end
  end

  private
    def validate_product_limit
      return unless self.business
      if self.business.products.count >= 4
        errors.add(:base, "Se ha alcanzado el límite máximo de productos para este negocio. Puedes eliminar uno de tus productos antiguos y sustituirlo por uno nuevo")
      end
    end
end
