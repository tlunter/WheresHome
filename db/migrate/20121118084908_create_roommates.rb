class CreateRoommates < ActiveRecord::Migration
  def change
    create_table :roommate do |t|
      t.integer :application_id
      t.integer :buyer_id

      t.timestamps
    end

    change_table :roommate do |t|
      t.foreign_key :application
      t.foreign_key :buyer
    end
  end
end
