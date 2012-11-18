# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  address1   :string(255)
#  address2   :string(255)
#  city       :string(255)
#  state      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Location < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :state, :zipcode
  
  before_save do |loc|
    loc.state = loc.state.upcase
  end

  VALID_STATE_REGEX = /[a-zA-Z]{2}/
  VALID_CITY_REGEX  = /[a-zA-Z]+/
  VALID_ZIPCODE_REGEX = /[0-9]{5}/

  validates :state, presence: true,
                    format: { with: VALID_STATE_REGEX }
  validates :city, presence: true,
                   format: { with: VALID_CITY_REGEX }
  validates :zipcode, presence: true,
                    format: { with: VALID_ZIPCODE_REGEX }
  validates :address1, presence: true

  belongs_to :buyer
  belongs_to :property
  belongs_to :job
  
end
