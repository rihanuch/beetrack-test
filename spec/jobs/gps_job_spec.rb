require 'rails_helper'

RSpec.describe GpsJob, type: :job do
  before do
    vehicle = create(:vehicle)
    waypoint = create(:waypoint, vehicle: vehicle)
  end

  after(:all) do
    Vehicle.delete_all
    Waypoint.delete_all
  end

  describe 'POST /create' do
    context 'with valid parameters and unexisting vehicle' do
      let(:simulate_post) do
        {
          latitude: 20.23,
          longitude: -0.59,
          sent_at: "2016-06-04 20:45:00",
          vehicle_identifier: "HA-342213"
        }
      end

      it 'enqueues a job' do
        ActiveJob::Base.queue_adapter = :test
        expect { described_class.perform_later(simulate_post) }.to have_enqueued_job
      end
    end
  end
end
