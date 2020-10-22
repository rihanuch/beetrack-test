class CreateWaypoints < ActiveRecord::Migration[6.0]
  def change
    create_table :waypoints do |t|
      t.references :vehicle, null: false, foreign_key: true
      t.float :lat
      t.float :long
      t.datetime :sent_at

      t.timestamps
    end
  end
end
