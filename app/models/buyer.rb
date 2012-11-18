# == Schema Information
#
# Table name: buyers
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

class Buyer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable,
         :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
    :first_name, :last_name, :phone_number
 
  has_many :locations, dependent: :delete_all
  has_many :jobs, dependent: :delete_all
  has_one :picture
  
  def self.find_for_linkedin_oauth(auth, signed_in_resource=nil)
    data = auth.info
    user = Buyer.where(email: auth.info.email).first
    if user
      user["first_name"] = data["first_name"]
      user["last_name"] = data["last_name"]
      user.save
    else
      user = Buyer.create(first_name: data["first_name"],
                          last_name: data["last_name"],
                          email: data["email"],
                          password: Devise.friendly_token[0,20]
                         )
    end
    user
  end
end
