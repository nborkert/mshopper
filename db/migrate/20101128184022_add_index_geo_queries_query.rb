class AddIndexGeoQueriesQuery < ActiveRecord::Migration
  def self.up
    add_index(:geo_queries_stations, :geo_query_id)
  end

  def self.down
    remove_index(:geo_queries_stations, :geo_query_id)
  end
end
