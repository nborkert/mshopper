class RemoveIdFromGeoQueriesStations < ActiveRecord::Migration
  def self.up
    remove_column(:geo_queries_stations, :id)   
  end

  def self.down
  end
end
