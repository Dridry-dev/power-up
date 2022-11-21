class Prestation < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { in: 0..1000000 }
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 50, message: 'make a longer description biatch' }
end
