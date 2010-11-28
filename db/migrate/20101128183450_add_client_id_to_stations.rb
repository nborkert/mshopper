class AddClientIdToStations < ActiveRecord::Migration
  def self.up
    add_column :stations, :client_id, :integer
  end

  def self.down
    remove_column :stations, :client_id
  end
end
