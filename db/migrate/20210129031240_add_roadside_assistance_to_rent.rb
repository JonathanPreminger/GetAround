class AddRoadsideAssistanceToRent < ActiveRecord::Migration[6.0]
  def change
    add_column :rents, :roadside_assistance, :integer
  end
end
