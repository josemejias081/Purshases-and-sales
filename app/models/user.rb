class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :name, presence: true
  validates :email, presence: true
  validates :role, presence: true

  has_many :businesses, dependent: :destroy

  enum role: [:Visitor, :Admin, :superadmin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :Visitor
  end

  def has_role role
    self.role.name == role
  end
end