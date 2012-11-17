class Property < ActiveRecord::Base
  attr_accessible :max_price, :min_price, :sell_type, :status
end
