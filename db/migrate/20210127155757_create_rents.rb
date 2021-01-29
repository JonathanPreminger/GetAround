class CreateRents < ActiveRecord::Migration[6.0]
  def change
    create_table :rents do |t|
      t.references :user, null: false, foreign_key: true
      t.references :car, null: false, foreign_key: true
      t.integer :distance
      t.date :start_rent
      t.date :end_rent

      t.timestamps
    end
  end
end
