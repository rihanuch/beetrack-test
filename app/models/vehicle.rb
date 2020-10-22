class Vehicle < ApplicationRecord
  has_many :waypoints
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
