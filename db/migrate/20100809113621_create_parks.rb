class CreateParks < ActiveRecord::Migration
  def self.up
    create_table :parks do |t|
      t.string :name
      t.string :location
      t.string :park_id
      t.string :ref
      t.float :area_hectares
      t.string :park_type
      t.string :longitude
      t.string :latitude

      t.timestamps
    end
  end

  def self.down
    drop_table :parks
  end
end
