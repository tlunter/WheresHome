class AddLocationToJob < ActiveRecord::Migration
  def change
    add_foreign_key(:jobs, :locations, dependent: :delete)
  end
end
