class MakeVehicleNameUnique < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    add_index :vehicles, :vehicle_identifier, unique: true, algorithm: :concurrently
  end
end