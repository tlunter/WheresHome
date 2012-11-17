class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.integer :min_price
      t.integer :max_price
      t.integer :sell_type
      t.integer :status

      t.timestamps
    end
  end
end
