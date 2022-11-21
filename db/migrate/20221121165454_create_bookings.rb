class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :date
      t.references :user, null: false, foreign_key: true
      t.references :prestation, null: false, foreign_key: true
      t.integer :validation

      t.timestamps
    end
  end
end
