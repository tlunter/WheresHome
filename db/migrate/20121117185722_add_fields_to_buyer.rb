class AddFieldsToBuyer < ActiveRecord::Migration
  def change
    change_table :buyers do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number

      t.foreign_key :locations, dependent: :delete
      t.foreign_key :jobs, dependent: :delete
      t.foreign_key :pictures, dependent: :delete
      t.foreign_key :jobs, dependent: :delete, name: 'current_job'
    end
  end
end
