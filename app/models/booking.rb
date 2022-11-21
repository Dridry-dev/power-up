class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :prestation

  enum :validation, pending: 0, validated: 1, refused: 2
  validates :date, presence: true
end
