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

require 'test_helper'

class JobTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
