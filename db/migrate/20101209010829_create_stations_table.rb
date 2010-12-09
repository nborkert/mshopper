class CreateStationsTable < ActiveRecord::Migration
  def self.up
  create_table :stations do |t|
      t.string :name
      t.decimal :lat, :precision => 10, :scale => 7
      t.decimal :lon, :precision => 10, :scale => 7
      t.string :street_addr_line1
      t.string :street_addr_line2
      t.string :city
      t.string :state
      t.string :zip
      t.string :description
	  t.date :enrollment_date
	  t.integer :client_id
      t.timestamps
	  
	  
    end
  end

  def self.down
  end
end
