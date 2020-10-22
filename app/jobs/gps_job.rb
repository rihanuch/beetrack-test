class GpsJob < ApplicationJob
  queue_as :default

  # adds the waypoint indicated by the params to the record db
  def perform(request_params)
    Waypoint.create(parse_params(request_params))
  end

  # ensure that parameters have correct format to create the records
  # lat, long -> float
  # sent_at -> DateTime
  # vehicle: -> Vehicle record
  def parse_params(request_params)
    {
      lat: request_params[:latitude].to_f,
      long: request_params[:longitude].to_f,
      sent_at: DateTime.strptime(request_params[:sent_at], '%Y-%m-%d %H:%M:%S'),
      # if no Vehicle is found with the identifier, then we create one
      # we clean the input and standarize with uppercase
      vehicle: Vehicle.find_or_create_by(vehicle_identifier: request_params[:vehicle_identifier].strip.upcase)
    }
  end
end
