class Roommate < ActiveRecord::Base
  attr_accessible :application, :buyer

  belongs_to :application
  belongs_to :buyer
end
