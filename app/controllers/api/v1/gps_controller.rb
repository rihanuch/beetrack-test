require 'date'

class Api::V1::GpsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    wp = Waypoint.create(parse_params)
    head(:ok)
  end

  private

  def parse_params
    {
      lat: request_params[:latitude].to_f,
      long: request_params[:longitude].to_f,
      sent_at: DateTime.strptime(request_params[:sent_at], '%Y-%m-%d %H:%M:%S'),
      vehicle: Vehicle.find_or_create_by(vehicle_identifier: request_params[:vehicle_identifier])
    }
  end

  def request_params
    # minimun parameters
    params.require([:vehicle_identifier, :latitude, :longitude, :sent_at])
    # allow only defined
    params.permit(:vehicle_identifier, :latitude, :longitude, :sent_at)
  end
end
