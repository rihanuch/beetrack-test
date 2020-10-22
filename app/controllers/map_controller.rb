class MapController < ApplicationController

    def index
        @waypoints = []
        Vehicle.all.each do |vehicle|
            last_loc = vehicle.last_location
            @waypoints << [last_loc.vehicle.vehicle_identifier, last_loc.lat, last_loc.long]
        end
        @waypoints
    end
end
