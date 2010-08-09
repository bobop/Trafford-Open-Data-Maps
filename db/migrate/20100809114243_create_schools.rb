class CreateSchools < ActiveRecord::Migration
  def self.up
    create_table :schools do |t|
      t.string :urn
      t.string :lea
      t.string :establishment
      t.string :name
      t.string :school_type
      t.string :email
      t.string :url
      t.string :longitude
      t.string :latitude

      t.timestamps
    end
  end

  def self.down
    drop_table :schools
  end
end
