class AddMoreFieldsToBuyer < ActiveRecord::Migration
  def change

    change_table :buyers do |t|
      t.integer :monthly_income
      t.date :move_in
      t.boolean :pets

      t.foreign_key :locations, name: "current_address"
      t.foreign_key :locations, name: "previous_address"

      t.foreign_key :sellers, name: "current_landlord"
      t.foreign_key :sellers, name: "previous_landlord"

    end
  end
end
