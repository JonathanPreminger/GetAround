class AddRestGoesToUsToRent < ActiveRecord::Migration[6.0]
  def change
    add_column :rents, :rest_goes_to_us, :integer
  end
end
