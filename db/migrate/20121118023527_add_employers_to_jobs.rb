class AddEmployersToJobs < ActiveRecord::Migration
  def change
    change_table :jobs do |t|
      t.foreign_key :employers
    end
  end
end
