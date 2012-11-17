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
  
  validates :max_price, prescence: true,
                        numericality: { only_integer: true }

  has_many :pictures
  has_one :location
  belongs_to :seller
  validates_associated :location, :pictures
end
