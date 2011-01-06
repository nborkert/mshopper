class GeoQueriesController < ApplicationController
  skip_before_filter  :authorize

  # GET /geo_queries
  # GET /geo_queries.xml
  def index
    puts 'getting geo queries'
    @geo_queries = GeoQuery.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @geo_queries }
    end
  end

 
end
