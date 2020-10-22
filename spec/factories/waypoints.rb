FactoryBot.define do
  factory :waypoint do
    vehicle { 1 }
    lat { 51.506767 }
    long { -0.130445 }
    sent_at { "2020-10-22 11:28:40" }
  end
end
