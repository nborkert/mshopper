class AddEnrollmentDateToStations < ActiveRecord::Migration
  def self.up
    add_column :stations, :enrollment_date, :date
  end

  def self.down
    remove_column :stations, :enrollment_date
  end
end
