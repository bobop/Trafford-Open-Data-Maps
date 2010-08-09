class CreateLeisureCentres < ActiveRecord::Migration
  def self.up
    create_table :leisure_centres do |t|
      t.string :name
      t.string :longitude
      t.string :latitude

      t.timestamps
    end
  end

  def self.down
    drop_table :leisure_centres
  end
end
