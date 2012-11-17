class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :company
      t.string :title
      t.int :salary
      t.string :phonenumber

      t.timestamps
    end
  end
end
