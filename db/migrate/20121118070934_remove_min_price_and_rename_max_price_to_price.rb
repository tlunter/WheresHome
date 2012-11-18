class RemoveMinPriceAndRenameMaxPriceToPrice < ActiveRecord::Migration
  def change
    remove_column :properties, :min_price
    rename_column :properties, :max_price, :price
  end
end
