class LatLon

  attr_accessor :lat, :lon, :location_errors

  def initialize(lat, lon)
    @lat = lat
    @lon = lon
	#@location_errors = ''
  end

end
