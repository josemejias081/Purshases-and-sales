class Property < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :portrait
  has_many_attached :images
  validates :user, presence: true

  enum type_property: [:casa, :apartamento, :terreno, :local, :oficina]
  after_initialize :set_default_type_property, :if => :new_record?

  enum roof: [:acerolit, :machiembrado, :platabanda, :zinc]
  after_initialize :set_default_roof, :if => :new_record?

  enum floor: [:cemento, :granito, :ceramica, :porcelanato, :parquet]
  after_initialize :set_default_floor, :if => :new_record?

  def set_default_type_property
    self.type_property ||= :casa 
  end

  def has_type_property type_property
    self.type_property.name == type_property
  end

  def is_casa?
    self.casa == "casa"
  end

  def is_apartamento?
    self.apartamento == "apartamento"
  end

  def is_terreno?
    self.terreno == "terreno"
  end

  def is_local?
    self.local == "local"
  end

  def is_oficina?
    self.local == "oficina"
  end

  def set_default_roof
    self.roof ||= :acerolit 
  end

  def has_roof roof
    self.roof.name == roof
  end

  def is_acerolit?
    self.acerolit == "acerolit"
  end

  def is_machiembrado?
    self.machiembrado == "machiembrado"
  end

  def is_platabanda?
    self.platabanda == "platabanda"
  end

  def is_zinc?
    self.zinc == "zinc"
  end


  def set_default_floor
    self.floor ||= :acerolit 
  end

  def has_floor floor
    self.floor.name == floor
  end

  def is_acerolit?
    self.cemento == "cemento"
  end

  def is_machiembrado?
    self.granito == "granito"
  end

  def is_platabanda?
    self.ceramica == "ceramica"
  end

  def is_zinc?
    self.porcelanato == "porcelanato"
  end

  def is_zinc?
    self.parquet == "parquet"
  end
end
