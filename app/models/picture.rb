# == Schema Information
#
# Table name: pictures
#
#  id         :integer          not null, primary key
#  location   :string(255)
#  width      :integer
#  height     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Picture < ActiveRecord::Base
  attr_accessible :height, :location, :width
end
