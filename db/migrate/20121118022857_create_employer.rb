class CreateEmployer < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.string :company_name
      t.string :manager_first_name
      t.string :manager_last_name
      t.string :phone

    end
    change_table :employers do |t|
      t.foreign_key :locations
    end
  end
end
