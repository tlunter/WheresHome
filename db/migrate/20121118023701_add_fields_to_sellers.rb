class AddFieldsToSellers < ActiveRecord::Migration
  def change
    change_table :properties do |t|
      t.integer :min_salary
      t.integer :bedrooms
      t.integer :full_bathrooms
      t.integer :half_bathrooms
      t.date :available_on
      t.boolean :pets_allowed
      t.boolean :laundry_available
      t.boolean :parking_available
      t.text :description

      t.foreign_key :seller
    end
  end
end
