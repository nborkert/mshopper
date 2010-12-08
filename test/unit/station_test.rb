require 'test_helper'
require 'station'
require 'lat_lon'

class StationTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true	
  end
  
  test "find URL for maps img" do
    assert true
	test_station = Station.new 
	
	location = test_station.find_lat_lon_for_address('5642 Timberly Ln', '', 'Pipersville', 'PA', '18947')
	puts 'FINAL ANSWER'
	puts 'LAT: '+location.lat
	puts 'LON: '+location.lon 
	
	url = test_station.create_static_map_img_url(location.lat, location.lon)
	puts 'MAP URL: '+url
  end
  
end
