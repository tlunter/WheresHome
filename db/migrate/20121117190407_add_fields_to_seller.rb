class AddFieldsToSeller < ActiveRecord::Migration
  def change
    change_table :sellers do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number

      t.foreign_key :properties, dependent: :delete
      t.foreign_key :pictures, dependent: :delete
    end
  end
end
