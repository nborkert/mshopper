require 'test_helper'
require 'station'

class StationTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true	
  end
  
  test "find URL for maps img" do
    assert true
	test_station = Station.new 
	test_station.find_map_img_url
	test_station.find_lat_lon_for_address
  end
  
end
