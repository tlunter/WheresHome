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
end
