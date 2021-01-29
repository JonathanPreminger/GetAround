class AddPriceToRent < ActiveRecord::Migration[6.0]
  def change
    add_column :rents, :price, :integer
  end
end
