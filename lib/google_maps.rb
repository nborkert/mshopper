require 'net/http'
require 'rexml/document'
require 'lat_lon'

module GoogleMaps

  def find_lat_lon_for_address(street_address_line1, street_address_line2, city, state, zip)
    #Final geolocation URL has format like this:
    # http://maps.google.com/maps/geo?q=5642+Timberly+Lane,Pipersville,PA,18947&output=xml&oe=utf8&sensor=false
    
    #Final mapping URL has format like this:
    #http://maps.google.com/maps/api/staticmap?center=40.3863435,-75.1340195&zoom=14&sensor=false&size=512x512&maptype=roadmap&markers=color:green%7Clabel:.%7C40.3863435,-75.1340195
    # Where 40.38... is the latitude and -75.134... is the longitude
  
	street1 = street_address_line1.tr(' ','+')
	if street1 == nil
	  street1 = street_address_line1
	end
	
	street2 = street_address_line2.tr(' ','+')
	if street2 == nil
	  street2 = street_address_line2
	end
	
	
	#puts '/maps/geo?q='+street1+','+street2+','+city+','+state+','+zip+'&output=xml&oe=utf8&sensor=false'
    #response = Net::HTTP.get_response('maps.google.com', '/maps/geo?q=5642+Timberly+Lane,,Pipersville,PA,18947&output=xml&oe=utf8&sensor=false')
    response = Net::HTTP.get_response('maps.google.com', '/maps/geo?q='+street1+','+street2+','+city+','+state+','+zip+'&output=xml&oe=utf8&sensor=false')
    #puts "Code = #{response.code}"
    #puts response.body

    xml = REXML::Document.new(response.body)
    #puts "Root element: #{xml.root.name}"
    lat = ''
    lon = ''
	location_count = 0
    xml.elements.each("//coordinates")  do |c| 
      #puts c.text
	  location_count = location_count + 1
      lat_lon = c.text.split(',')
      #puts lat_lon[0]
      lat = lat_lon[1]
      #puts lat_lon[1]
      lon = lat_lon[0]
      #full_url = 'http://maps.google.com/maps/api/staticmap?center=' + lat_lon[1] + ',' + lat_lon[0] + '&zoom=14&sensor=false&size=256x256&maptype=roadmap&markers=color:green%7Clabel:.%7C' + lat_lon[1] +','+lat_lon[0]
      #puts full_url
    end
	location = LatLon.new(lat, lon)
	if location_count > 1
	  location.location_errors = 'Multiple locations found. Only a single location is permitted.'
	end
	if location_count == 0
	  location.location_errors = 'Location not found.'
	end
	return location 
  end
  
  def create_static_map_img_url (lat, lon)
    return 'http://maps.google.com/maps/api/staticmap?center=' + lat + ',' + lon + '&zoom=14&sensor=false&size=256x256&maptype=roadmap&markers=color:green%7Clabel:.%7C' + lat +','+lon
  end
  
end 

