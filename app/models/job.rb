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
  validates :company, presence: true
  validates :title, presence: true
  validates :salary, presence: true
  
  VALID_PHONE_NUMBER_REGEX = /\(\d{3}\)\d{3}-\d{4}/
  validates :phonenumber, presence: true,
                          format: { with: VALID_PHONE_NUMBER_REGEX }

  belongs_to :buyer
  has_one :location

  validates_associated :location
end
