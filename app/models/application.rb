class Application < ActiveRecord::Base
  attr_accessible :property, :buyers

  has_many :roomates
  has_many :buyers, through: :roomates
  belongs_to :property
end
