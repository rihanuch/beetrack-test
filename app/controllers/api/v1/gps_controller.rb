require 'date'

class Api::V1::GpsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # job is queued to a background task and returns 200
  # to confirm that the api recieved successfully the parameters
  # in case that one parameter is missing the api will respond
  # with 400 via the request params method
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
