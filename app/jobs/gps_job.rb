class GpsJob < ApplicationJob
  queue_as :default

  def perform(request_params)
    Waypoint.create(parse_params(request_params))
  end

  def parse_params(request_params)
    {
      lat: request_params[:latitude].to_f,
      long: request_params[:longitude].to_f,
      sent_at: DateTime.strptime(request_params[:sent_at], '%Y-%m-%d %H:%M:%S'),
      vehicle: Vehicle.find_or_create_by(vehicle_identifier: request_params[:vehicle_identifier])
    }
  end
end
