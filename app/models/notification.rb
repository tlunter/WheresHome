class Notification < ActiveRecord::Base
  attr_accessible :message, :viewed, :buyer, :seller, :property
  belongs_to :buyer
  belongs_to :seller
  belongs_to :property
end
