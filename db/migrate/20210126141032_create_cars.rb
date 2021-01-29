class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.integer :price_per_day
      t.integer :price_per_km
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
