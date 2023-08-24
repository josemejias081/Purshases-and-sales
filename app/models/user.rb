class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :name, presence: true
  validates :email, presence: true
  validates :role, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :password, presence: true

  has_many :businesses, dependent: :destroy

  has_many :products, through: :businesses

  has_many :properties

  enum role: [:visitor, :admin, :superadmin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :visitor
  end

  def has_role role
    self.role.name == role
  end

  def is_superadmin?
    self.role == "superadmin"
  end

  def is_admin?
    self.role == "admin"
  end  
end
