class AddInsuranceToRent < ActiveRecord::Migration[6.0]
  def change
    add_column :rents, :insurance, :integer
  end
end
