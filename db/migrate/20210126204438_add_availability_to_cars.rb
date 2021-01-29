class AddAvailabilityToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :available_from, :date
    add_column :cars, :available_to, :date
  end
end
