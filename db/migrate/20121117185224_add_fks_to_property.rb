class AddFksToProperty < ActiveRecord::Migration
  def change
    add_foreign_key(:properties, :locations, dependent: :delete)
    add_foreign_key(:properties, :pictures, dependent: :delete)
  end
end
