class AddZipCodeToLocation < ActiveRecord::Migration
  def change
    change_table :locations do |t|
      t.string :zipcode
    end
  end
end
