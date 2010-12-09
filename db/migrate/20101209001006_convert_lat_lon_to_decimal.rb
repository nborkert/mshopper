class ConvertLatLonToDecimal < ActiveRecord::Migration
  def self.up
    change_column :stations, :lat, :decimal, :precision => 10, :scale => 7
	change_column :stations, :lon, :decimal, :precision => 10, :scale => 7
  end

  def self.down
  end
end
