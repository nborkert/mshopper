class CreateEvOwners < ActiveRecord::Migration
  def self.up
    create_table :ev_owners do |t|
      t.string :email_address
      t.decimal "lat",  :precision => 10, :scale => 7
      t.decimal "lon",  :precision => 10, :scale => 7

      t.timestamps
    end
  end

  def self.down
    drop_table :ev_owners
  end
end
