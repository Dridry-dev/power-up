class RemovePriceFromPrestations < ActiveRecord::Migration[7.0]
  def change
    remove_column :prestations, :price, :decimal
  end
end
