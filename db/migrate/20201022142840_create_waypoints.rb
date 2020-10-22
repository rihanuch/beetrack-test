class CreateWaypoints < ActiveRecord::Migration[6.0]
  def change
    create_table :waypoints do |t|
      t.references :vehicle, null: false, foreign_key: true
      t.float :lat, null: false
      t.float :long, null: false
      t.datetime :sent_at, null: false

      t.timestamps
    end
  end
end
