# == Schema Information
#
# Table name: properties
#
#  id                :integer          not null, primary key
#  min_price         :integer
#  max_price         :integer
#  sell_type         :integer
#  status            :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  min_salary        :integer
#  bedrooms          :integer
#  full_bathrooms    :integer
#  half_bathrooms    :integer
#  available_on      :date
#  pets_allowed      :boolean
#  laundry_available :boolean
#  parking_available :boolean
#  description       :text
#

require 'test_helper'

class PropertyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
