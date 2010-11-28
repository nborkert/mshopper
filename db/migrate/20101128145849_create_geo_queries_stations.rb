class CreateGeoQueriesStations < ActiveRecord::Migration
  def self.up
    create_table :geo_queries_stations do |t|
      t.integer :qeo_query_id
      t.integer :station_id

      t.timestamps
    end
  end

  def self.down
    drop_table :geo_queries_stations
  end
end
