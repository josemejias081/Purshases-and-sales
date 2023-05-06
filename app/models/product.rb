class Product < ApplicationRecord
  belongs_to :business, optional: true
  has_one_attached :image

  #validates :images, content_type: ['image/png', 'image/jpg', 'image/jpeg']     
  #validates :images, limit: { min: 1, max: 3 }

  def images_validation
    if images.attached?
      images.each do |image|
        if image.byte_size > 5.megabyte
          errors.add(:Foto, ": debe ser menor de 5MB") and return
        end
      end
    end
  end
end
