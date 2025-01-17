class Vehicle < ApplicationRecord
  has_many :waypoints

  # get most recent waypoint sent to api
  # return first one as we only need one
  def last_location
    waypoints.order(sent_at: :desc).first
  end
end

# == Schema Information
#
# Table name: vehicles
#
#  id                 :bigint(8)        not null, primary key
#  vehicle_identifier :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_vehicles_on_vehicle_identifier  (vehicle_identifier) UNIQUE
#
