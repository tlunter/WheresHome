# == Schema Information
#
# Table name: properties
#
#  id         :integer          not null, primary key
#  min_price  :integer
#  max_price  :integer
#  sell_type  :integer
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PropertyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
