require 'rails_helper'

RSpec.describe MapController, type: :controller do
  # create account method for each describe
  # used for compatibility with devise

  before do
    vehicle = create(:vehicle)
    waypoint = create(:waypoint, vehicle: vehicle)
    # default date of sent_at: "2020-10-22 11:28:40"
  end

  after(:all) do
    Vehicle.delete_all
    Waypoint.delete_all
  end

  let(:waypoints) do
    @controller.instance_variable_get(:@waypoints)
  end

  describe 'GET /index' do
    before { get :index }

    it { is_expected.to respond_with(200) }

    it 'returns list' do
      expect(waypoints).to be_a_kind_of(Array)
    end

    it 'is Array of Arrays' do
      expect(waypoints[0]).to be_a_kind_of(Array)
    end

    it 'Arrays are of length = 3' do
      expect(waypoints[0].length).to equal(3)
    end

    it 'Arrays have correct type (name: str, lat: float, long: float)' do
      expect(waypoints[0][0]).to be_a_kind_of(String)
      expect(waypoints[0][1]).to be_a_kind_of(Float)
      expect(waypoints[0][2]).to be_a_kind_of(Float)
    end
  end
end
