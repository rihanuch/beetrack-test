require 'date'

class Api::V1::GpsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    GpsJob.perform_later(request_params)
    head(:ok)
  end

  private

  def request_params
    # minimun parameters
    params.require([:vehicle_identifier, :latitude, :longitude, :sent_at])
    # allow only defined
    params.permit(:vehicle_identifier, :latitude, :longitude, :sent_at)
  end
end
