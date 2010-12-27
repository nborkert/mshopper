class StationsController < ApplicationController
  #skip_before_filter  :authorize, :only => [:index, :show]
  skip_before_filter  :authorize, :only => [:index]
  
  # GET /stations
  # GET /stations.xml
  # This action is the heart of the application from the consumer's point of view. It performs the query to find nearby stations.
  def index
    if params[:lat] == nil or params[:lon] == nil then  #not a consumer query
	  if session[:userid] == nil  #No client userid in session, this is an admin query
        @stations = Station.all
	  else  #Found a client userid in session, restrict results to client's stations
	    client_result = Client.find_by_userid(session[:userid])
		
		if client_result.stations != nil #ActiveRecord returns nil when attempting to do a 'find' and not finding anything
											#The reference to .stations does a 'find' and returns nil if no stations found for the client
          @stations = client_result.stations
		else    #Need to send a non-nil, empty array back to view
		  @stations = []
		end
		
	  end
	  
	else  #found lat and lon in query, this is a consumer query
      latMax = BigDecimal.new(params[:lat]) + 0.5
	  latMin = BigDecimal.new(params[:lat]) - 0.5
	  lonMax = BigDecimal.new(params[:lon]) + 0.5
	  lonMin = BigDecimal.new(params[:lon]) - 0.5
	  
	  if params[:client_id] == nil  #Add client_id parameter to query if it was sent in request
	    @stations = Station.where("lat < :latMax and lat > :latMin and lon < :lonMax and lon > :lonMin", {:latMax => latMax, :latMin => latMin, :lonMax => lonMax, :lonMin => lonMin})
	  else
	    @stations = Station.where("lat < :latMax and lat > :latMin and lon < :lonMax and lon > :lonMin and client_id = :client_id", {:latMax => latMax, :latMin => latMin, :lonMax => lonMax, :lonMin => lonMin, :client_id => params[:client_id]})
	  end
	  
	  #if any stations were returned in consumer query, add them to user's geo query and save
      if @stations != nil then
	    #create geoquery for analytics
        user_qry = GeoQuery.new
	    user_qry.lat = params[:lat]
	    user_qry.lon = params[:lon]	  
	    user_qry.stations << @stations
	    user_qry.save  
      end
	 	 	  
	end
	
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stations }
	  format.json { render :json => @stations }
    end
  end

  # GET /stations/1
  # GET /stations/1.xml
  def show
    @station = Station.find(params[:id])
	
	puts @station.client_id
	
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @station }
	  format.json { render :json => @station }
    end
  end

  # GET /stations/new
  # GET /stations/new.xml
  def new
    @station = Station.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @station }
	  format.json { render :json => @station }
    end
  end

  # GET /stations/1/edit
  def edit
    @station = Station.find(params[:id])
  end

  # POST /stations
  # POST /stations.xml
  def create
    @station = Station.new(params[:station])
	client_result = Client.find_by_userid(session[:userid])
	@station.client = client_result
	
	respond_to do |format|
      if @station.save
        format.html { redirect_to(@station, :notice => 'Station was successfully created.') }
        format.xml  { render :xml => @station, :status => :created, :location => @station }
	  else
        format.html { render :action => "new" }
        format.xml  { render :xml => @station.errors, :status => :unprocessable_entity }
      end
	end	
	
  end

  # PUT /stations/1
  # PUT /stations/1.xml
  def update
    @station = Station.find(params[:id])
	# Call location mapping service to find latitude and longitude for supplied street address. Handled by validation on station model.

    respond_to do |format|
      if @station.update_attributes(params[:station])
        format.html { redirect_to(@station, :notice => 'Station was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @station.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stations/1
  # DELETE /stations/1.xml
  def destroy
    @station = Station.find(params[:id])
    @station.destroy

    respond_to do |format|
      format.html { redirect_to(stations_url) }
      format.xml  { head :ok }
    end
  end
end
