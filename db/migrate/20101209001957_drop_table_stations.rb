class DropTableStations < ActiveRecord::Migration
  def self.up
    drop_table(:stations)
  end

  def self.down
  end
end
