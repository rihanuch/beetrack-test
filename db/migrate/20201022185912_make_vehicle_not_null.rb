class MakeVehicleNotNull < ActiveRecord::Migration[6.0]
  def change
    safety_assured do
      execute 'ALTER TABLE "vehicles" ADD CONSTRAINT "vehicles_vehicle_identifier_null" CHECK ("vehicle_identifier" IS NOT NULL) NOT VALID' 
    end
  end
end

class ValidateMakeVehicleNotNull < ActiveRecord::Migration[6.0]
  def change
    safety_assured do
      execute 'ALTER TABLE "vehicles" VALIDATE CONSTRAINT "vehicles_vehicle_identifier_null"' 
    end
  end
end