class MapController < ApplicationController
  
  # get most recent location of each vehicle and return
  # (name (date), lat, long) to view map with markers
  def index
    @waypoints = []
    Vehicle.all.each do |vehicle|
      last_loc = vehicle.last_location
      @waypoints << ["#{last_loc.vehicle.vehicle_identifier} (#{last_loc.sent_at})", last_loc.lat, last_loc.long]
    end
    @waypoints
  end
end
