class AddIdsToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :job_id, :integer
    add_column :locations, :property_id, :integer
    add_column :locations, :buyer_id, :integer
    add_column :jobs, :buyer_id, :integer
    add_column :pictures, :buyer_id, :integer
    add_column :pictures, :seller_id, :integer
    add_column :pictures, :property_id, :integer
    add_column :properties, :seller_id, :integer
  end
end
