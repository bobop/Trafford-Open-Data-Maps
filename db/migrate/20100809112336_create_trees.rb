class CreateTrees < ActiveRecord::Migration
  def self.up
    create_table :trees do |t|
      t.string :tree_ref
      t.string :species
      t.string :locality_name
      t.string :district_name
      t.float :height
      t.string :dbh
      t.string :longitude
      t.string :latitude

      t.timestamps
    end
  end

  def self.down
    drop_table :trees
  end
end
