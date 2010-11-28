class AddIndexStationsClient < ActiveRecord::Migration
  def self.up
    add_index(:stations, :client_id)
  end

  def self.down
    remove_index(:stations, :client_id)
  end
end
