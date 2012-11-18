class DropEmployersMergeToJobs < ActiveRecord::Migration
  def change
    drop_table :employers
    
    change_table :jobs do |t|
      t.string :manager_first_name
      t.string :manager_last_name
      t.string :manager_email
    end
  end
end
