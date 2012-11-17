class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :location
      t.int :width
      t.int :height

      t.timestamps
    end
  end
end
