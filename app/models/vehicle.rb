class Vehicle < ApplicationRecord
  has_many :waypoints

  def last_location
    waypoints.order(sent_at: :desc).first
  end
end

# == Schema Information
#
# Table name: vehicles
#
#  id                 :bigint(8)        not null, primary key
#  vehicle_identifier :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
