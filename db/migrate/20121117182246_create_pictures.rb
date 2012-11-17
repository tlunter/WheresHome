class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :location
      t.integer :width
      t.integer :height

      t.timestamps
    end
  end
end
