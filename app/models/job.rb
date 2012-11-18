# == Schema Information
#
# Table name: jobs
#
#  id                 :integer          not null, primary key
#  company            :string(255)
#  title              :string(255)
#  salary             :integer
#  phonenumber        :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  manager_first_name :string(255)
#  manager_last_name  :string(255)
#  manager_email      :string(255)
#

class Job < ActiveRecord::Base
  belongs_to :buyer
  has_one :location

  attr_accessible :company, :phonenumber, :salary, :title,
    :manager_email, :manager_first_name, :manager_last_name,
    :location_attributes

  accepts_nested_attributes_for :location

  # Everything should be present
  validates :company, presence: true
  validates :title, presence: true
  validates :salary, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :manager_email, presence: true,
                            format: { with: VALID_EMAIL_REGEX,
                                      message: "The email address must be of a valid format" }
  validates :manager_first_name, presence: true
  validates :manager_last_name, presence: true
  
  VALID_PHONE_NUMBER_REGEX = /\(\d{3}\)\d{3}-\d{4}/
  validates :phonenumber, presence: true,
                          format: { with: VALID_PHONE_NUMBER_REGEX,
                                    message: "The phone number must be of the format '(555)555-5555'"}


  validates_associated :location
end
