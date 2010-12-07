require 'google_maps'

class Station < ActiveRecord::Base
  include GoogleMaps
  belongs_to :client 
  has_and_belongs_to_many :geo_queries
  
  def find_map_img_url
    puts "called find_map_img_url"
	#Final geolocation URL has format like this:
     # http://maps.google.com/maps/geo?q=5642+Timberly+Lane,+Pipersville,+PA&output=xml&oe=utf8&sensor=false
    
    #Final mapping URL has format like this:
     #http://maps.google.com/maps/api/staticmap?center=40.3863435,-75.1340195&zoom=14&sensor=false&size=512x512&maptype=roadmap&markers=color:green%7Clabel:.%7C40.3863435,-75.1340195
     # Where 40.38... is the latitude and -75.134... is the longitude
  
  end
  
  
end
