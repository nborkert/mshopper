class GeoQueriesController < ApplicationController
  skip_before_filter  :authorize

  # GET /geo_queries
  # GET /geo_queries.xml
  def index
    puts 'getting geo queries'
    @geo_queries = GeoQuery.where('id > 238')  #prior queries were test results from me
	#@geo_queries = GeoQuery.where('id > 10')  #prior queries were test results from me
	
	@final_url = 'http://maps.google.com/maps/api/staticmap?zoom=1&size=1024x1024&sensor=false&markers=size:tiny'
	@geo_queries.each do |qry|
	  @final_url = @final_url + '|' + qry.lat.to_s + ',' +qry.lon.to_s 	
	end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @geo_queries }
    end
  end

 
end
