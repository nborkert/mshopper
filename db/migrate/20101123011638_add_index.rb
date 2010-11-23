class AddIndex < ActiveRecord::Migration
  def self.up
    add_index(:stations, [:lat, :lon], :name => 'latlon')
  end

  def self.down
  end
end
