require 'net/http'
require 'rexml/document'

module GoogleMaps

  def find_lat_lon_for_address
    #puts "Yo, brutha!"

     #Final geolocation URL has format like this:
     # http://maps.google.com/maps/geo?q=5642+Timberly+Lane,+Pipersville,+PA&output=xml&oe=utf8&sensor=false
    
    #Final mapping URL has format like this:
     #http://maps.google.com/maps/api/staticmap?center=40.3863435,-75.1340195&zoom=14&sensor=false&size=512x512&maptype=roadmap&markers=color:green%7Clabel:.%7C40.3863435,-75.1340195
     # Where 40.38... is the latitude and -75.134... is the longitude
  

    response = Net::HTTP.get_response('maps.google.com', '/maps/geo?q=5642+Timberly+Lane,+Pipersville,+PA&output=xml&oe=utf8&sensor=false')

      #puts "Code = #{response.code}"
      #puts response.body

    xml = REXML::Document.new(response.body)
    #puts "Root element: #{xml.root.name}"
    lat = ''
    lon = ''
    xml.elements.each("//coordinates")  do |c| 
      #puts c.text
      lat_lon = c.text.split(',')
      #puts lat_lon[0]
      lat = lat_lon[1]
      #puts lat_lon[1]
      lon = lat_lon[0]
      full_url = 'http://maps.google.com/maps/api/staticmap?center=' + lat_lon[1] + ',' + lat_lon[0] + '&zoom=14&sensor=false&size=256x256&maptype=roadmap&markers=color:green%7Clabel:.%7C' + lat_lon[1] +','+lat_lon[0]
      puts full_url
    end
  end
  
end 

