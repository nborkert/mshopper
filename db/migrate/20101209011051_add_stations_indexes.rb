class AddStationsIndexes < ActiveRecord::Migration
  def self.up
    add_index(:stations, [:lat, :lon], :name => 'latlon')
    add_index(:stations, :client_id)
  end

  def self.down
  end
end
