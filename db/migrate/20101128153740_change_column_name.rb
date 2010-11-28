class ChangeColumnName < ActiveRecord::Migration
  def self.up
    rename_column :geo_queries_stations, :qeo_query_id, :geo_query_id
  end

  def self.down
  end
end
