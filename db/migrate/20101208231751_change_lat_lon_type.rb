class ChangeLatLonType < ActiveRecord::Migration
  def self.up
    change_column :stations, :lat, :string
	change_column :stations, :lon, :string
  end

  def self.down
  end
end
