class Business < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :user, optional: true

  #validates :user, presence: true

  #belongs_to :responsible, class_name: "User"

  #belongs_to :user, :foreign_key => 'responsible_id'


  has_many :products, dependent: :destroy
  has_one_attached :cover
  has_one_attached :logo
end
