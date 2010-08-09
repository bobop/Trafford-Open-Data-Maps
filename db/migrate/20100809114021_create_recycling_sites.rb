class CreateRecyclingSites < ActiveRecord::Migration
  def self.up
    create_table :recycling_sites do |t|
      t.string :site_id
      t.string :location
      t.string :street
      t.string :town
      t.string :longitude
      t.string :latitude
      t.string :facilities

      t.timestamps
    end
  end

  def self.down
    drop_table :recycling_sites
  end
end
