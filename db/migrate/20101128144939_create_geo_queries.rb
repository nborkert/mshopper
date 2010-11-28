class CreateGeoQueries < ActiveRecord::Migration
  def self.up
    create_table :geo_queries do |t|
      t.decimal :lat
      t.decimal :lon

      t.timestamps
    end
  end

  def self.down
    drop_table :geo_queries
  end
end
