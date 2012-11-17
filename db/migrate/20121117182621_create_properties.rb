class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.int :min_price
      t.int :max_price
      t.int :sell_type
      t.int :status

      t.timestamps
    end
  end
end
