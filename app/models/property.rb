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

class Property < ActiveRecord::Base
  attr_accessible :max_price, :min_price, :sell_type, :status
end