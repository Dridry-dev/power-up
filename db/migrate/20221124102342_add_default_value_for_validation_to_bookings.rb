class AddDefaultValueForValidationToBookings < ActiveRecord::Migration[7.0]
  def change
    change_column :bookings, :validation, :integer, default: 0
  end
end
