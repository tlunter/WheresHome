class ChangeNotificationToHaveApplicationInsteadOfBuyer < ActiveRecord::Migration
  def change
    remove_column :notifications, :buyer_id
    remove_column :notifications, :seller_id
    add_column :notifications, :application_id, :integer
  end
end
