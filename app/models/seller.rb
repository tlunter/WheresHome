# == Schema Information
#
# Table name: sellers
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string(255)
#  last_name              :string(255)
#  phone_number           :string(255)
#

class Seller < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
    :first_name, :last_name, :phone_number

  validates :first_name, presence: true
  validates :last_name, presence: true

  VALID_PHONE_NUMBER_REGEX = /\(\d{3}\)\d{3}-\d{4}/
  validates :phone_number, presence: true,
                          format: { with: VALID_PHONE_NUMBER_REGEX,
                                    message: "The phone number must be of the format '(555)555-5555'"}
  has_many :properties
  has_one :picture

end
