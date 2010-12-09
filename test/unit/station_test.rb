require 'test_helper'
require 'station'
require 'lat_lon'

class StationTest < ActiveSupport::TestCase
  
  test "find URL for maps img" do
    assert true
	test_station = Station.new 
	
	location = test_station.find_lat_lon_for_address('5642 Timberly Ln', '', 'Pipersville', 'PA', '18947')
	puts 'FINAL ANSWER'
	puts 'LAT: '+location.lat
	puts 'LON: '+location.lon 
	#puts 'ERRORS: '+location.location_errors
	assert location.location_errors == nil
	
	url = test_station.create_static_map_img_url(location.lat, location.lon)
	assert url == 'http://maps.google.com/maps/api/staticmap?center=40.3863435,-75.1340195&zoom=14&sensor=false&size=256x256&maptype=roadmap&markers=color:green%7Clabel:.%7C40.3863435,-75.1340195'
	puts 'MAP URL: '+url
	
	location = test_station.find_lat_lon_for_address('****', '', '', '', '')
	puts 'FINAL ANSWER'
	puts 'LAT: '+location.lat
	puts 'LON: '+location.lon 
	puts 'ERRORS: '+location.location_errors
	assert location.location_errors == 'Location not found.'
	
	location = test_station.find_lat_lon_for_address('1 Main Street', '', '', '', '')
	puts 'FINAL ANSWER'
	puts 'LAT: '+location.lat
	puts 'LON: '+location.lon 
	puts 'ERRORS: '+location.location_errors
	assert location.location_errors == 'Multiple locations found. Only a single location is permitted.'	
	
  end
  
  test "Retrieve stored station and display map img" do
    test_station = Station.find_by_name('MyString')
	puts test_station.zip
	puts test_station.lat
	puts test_station.create_static_map_img_url(test_station.lat.to_s, test_station.lon.to_s)
  
  
  end
  
end
