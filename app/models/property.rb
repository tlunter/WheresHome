# == Schema Information
#
# Table name: properties
#
#  id                :integer          not null, primary key
#  min_price         :integer
#  max_price         :integer
#  sell_type         :integer
#  status            :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  min_salary        :integer
#  bedrooms          :integer
#  full_bathrooms    :integer
#  half_bathrooms    :integer
#  available_on      :date
#  pets_allowed      :boolean
#  laundry_available :boolean
#  parking_available :boolean
#  description       :text
#

class Property < ActiveRecord::Base
  attr_accessible :price, :sell_type, :status,
    :bedrooms, :full_bathrooms, :half_bathrooms, :available_on,
    :pets_allowed, :laundry_available, :parking_available,
    :description, :location_attributes
  
  validates :price, presence: true,
                        numericality: { only_integer: true }

  has_many :pictures
  has_many :notifications
  has_one :location

  accepts_nested_attributes_for :location, :pictures
  
  belongs_to :seller
  validates_associated :location, :pictures
end
