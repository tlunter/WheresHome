class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.integer :property_id
      t.timestamps
    end

    change_table :applications do |t|
      t.foreign_key :property
    end
  end
end
