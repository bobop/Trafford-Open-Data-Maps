class CreateTrainStations < ActiveRecord::Migration
  def self.up
    create_table :train_stations do |t|
      t.string :crs_code
      t.string :name
      t.string :longitude
      t.string :latitude

      t.timestamps
    end
  end

  def self.down
    drop_table :train_stations
  end
end
