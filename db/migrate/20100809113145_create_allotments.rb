class CreateAllotments < ActiveRecord::Migration
  def self.up
    create_table :allotments do |t|
      t.string :allotment_id
      t.string :ref
      t.string :name
      t.string :area
      t.string :longitude
      t.string :latitude

      t.timestamps
    end
  end

  def self.down
    drop_table :allotments
  end
end
