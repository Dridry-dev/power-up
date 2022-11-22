class AddPriceFromPrestations < ActiveRecord::Migration[7.0]
  def change
    add_column :prestations, :price, :decimal, precision: 8, scale: 2
  end
end
