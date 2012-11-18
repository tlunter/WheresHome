class Application < ActiveRecord::Base
  attr_accessible :property, :buyers

  has_many :roommates
  has_many :buyers, through: :roommates
  belongs_to :property
end
