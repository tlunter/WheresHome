# == Schema Information
#
# Table name: jobs
#
#  id          :integer          not null, primary key
#  company     :string(255)
#  title       :string(255)
#  salary      :integer
#  phonenumber :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Job < ActiveRecord::Base
  attr_accessible :company, :phonenumber, :salary, :title

  # Everything should be present
  validates :company, prescence: true
  validates :title, prescence: true
  validates :salary, prescence: true
  
  VALID_PHONE_NUMBER_REGEX = /\(\d{3}\)\d{3}-\d{4}/
  validates :phonenumber, prescence: true,
                          format: { with: VALID_PHONE_NUMBER_REGEX }

  belongs_to :buyer
  has_one :location
end
