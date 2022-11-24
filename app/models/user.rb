class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :prestations, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :email, presence: true
  validates :name, uniqueness: true, presence: true
  validates :description, presence: true, length: { minimum: 20, message: 'make a longer description biatch' }
end
