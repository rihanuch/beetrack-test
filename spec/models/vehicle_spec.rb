require 'rails_helper'

RSpec.describe Vehicle, type: :model do

  before(:each) do
    @vehicle = create(:vehicle)
  end

  after(:all) do
    Vehicle.delete_all
  end

  describe 'attributes' do
    it 'is valid with valid attributes' do
      expect(@vehicle).to be_valid
    end

    it 'is invalid with repeated names' do
      expect{create(:vehicle, vehicle_identifier: "HA-3454")}.to raise_error
    end
  end

  describe 'methods' do
    it 'returns last waypoint' do
      # default sent_at: "2020-10-22 11:28:40"
      waypoint_1 = create(:waypoint, vehicle: @vehicle)
      waypoint_2 = create(:waypoint, vehicle: @vehicle, sent_at: "2021-11-04 20:45:00")
      expect(@vehicle.last_location.sent_at).to eq(waypoint_2.sent_at)
    end
  end
end