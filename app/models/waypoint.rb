class Waypoint < ApplicationRecord
  belongs_to :vehicle
end

# == Schema Information
#
# Table name: waypoints
#
#  id         :bigint(8)        not null, primary key
#  vehicle_id :bigint(8)        not null
#  lat        :float            not null
#  long       :float            not null
#  sent_at    :datetime         not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_waypoints_on_vehicle_id  (vehicle_id)
#
# Foreign Keys
#
#  fk_rails_...  (vehicle_id => vehicles.id)
#
