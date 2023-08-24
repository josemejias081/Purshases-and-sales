class Event < ApplicationRecord
  has_one_attached :portrait
  enum status: [:próximamente, :pasado, :suspendido]
  after_initialize :set_default_status, :if => :new_record?

  
  validates :portrait, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :location, presence: true
  validates :speaker, presence: true
  validates :price, presence: true
  validates :modality, presence: true
  validates :cost, presence: true
  validates :status, presence: true

  def set_default_status
    self.status ||= :próximamente
  end

  def has_status status
    self.status.name == status
  end

  def is_pasado?
    self.pasado == "Pasado"
  end

  def is_suspendido?
    self.role == "Suspendido"
  end
end
