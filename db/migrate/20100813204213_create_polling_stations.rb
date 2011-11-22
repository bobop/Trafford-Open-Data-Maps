class CreatePollingStations < ActiveRecord::Migration
  def self.up
    create_table :polling_stations do |t|
      t.string :ref
      t.integer :prefix
      t.string :ward_code
      t.string :polling_district_code
      t.string :ward_name
      t.string :access
      t.string :availability
      t.string :name
      t.string :longitude
      t.string :latitude

      t.timestamps
    end
  end

  def self.down
    drop_table :polling_stations
  end
end
