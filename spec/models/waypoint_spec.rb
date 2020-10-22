require 'rails_helper'

RSpec.describe Waypoint, type: :model do
  before do
    @vehicle = build(:vehicle)
    @waypoint = build(:waypoint, vehicle: @vehicle)
  end

  after(:all) do
    Vehicle.delete_all
  end

  it 'is valid with valid attributes' do
    expect(@waypoint).to be_valid
  end

  it 'is not valid without a lat, long, or vehicle' do
    # should raise ActiveRecord::NotNullViolation
    expect { create(:waypoint, vehicle: @vehicle, lat: nil) }.to raise_error
    expect { create(:waypoint, vehicle: @vehicle, long: nil) }.to raise_error
    expect { create(:waypoint, vehicle: nil) }.to raise_error
  end
end
