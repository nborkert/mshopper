class AddIndexForStationsQueries < ActiveRecord::Migration
  def self.up
    add_index(:geo_queries_stations, :station_id)
  end

  def self.down
    remove_index(:geo_queries_stations, :station_id)
  end
end
