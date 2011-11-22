class CreateChildrenCentres < ActiveRecord::Migration
  def self.up
    create_table :children_centres do |t|
      t.integer :centre_id
      t.string :name
      t.string :centre_type
      t.string :location
      t.string :address
      t.string :town
      t.string :postcode
      t.string :telephone
      t.string :notes
      t.string :longitude
      t.string :latitude

      t.timestamps
    end
  end

  def self.down
    drop_table :children_centres
  end
end
