require 'google_maps'
require 'lat_lon'

class Station < ActiveRecord::Base
  include GoogleMaps
  belongs_to :client 
  has_and_belongs_to_many :geo_queries
  
  
  validate   :find_location
  
  def find_location
    location = find_lat_lon_for_address(self.street_addr_line1, self.street_addr_line2, self.city, self.state, self.zip)
	if location.location_errors != nil
	    puts 'IN location.location_errors for Station.find_location'
		puts location.location_errors
		errors.add("", location.location_errors)
	end
	self.lat = location.lat
	self.lon = location.lon
  end
  
  
end
