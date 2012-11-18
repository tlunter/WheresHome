class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :buyer_id
      t.integer :seller_id
      t.integer :property_id
      t.string :message
      t.boolean :viewed
      t.timestamps
    end

    change_table :notifications do |t|
      t.foreign_key :buyer
      t.foreign_key :seller
      t.foreign_key :property
    end

  end
end
