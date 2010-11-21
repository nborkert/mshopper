class StationsController < ApplicationController
  # GET /stations
  # GET /stations.xml
  def index
    if params[:lat] == nil or params[:lon] == nil then
      @stations = Station.all
	else
      #@stations = Station.find_all_by_zip(params[:zip])
	  latMax = BigDecimal.new(params[:lat]) + 0.2
	  latMin = BigDecimal.new(params[:lat]) - 0.2
	  lonMax = BigDecimal.new(params[:lon]) + 0.2
	  lonMin = BigDecimal.new(params[:lon]) - 0.2
	  
	  @stations = Station.where("lat < :latMax and lat > :latMin and lon < :lonMax and lon > :lonMin", {:latMax => latMax, :latMin => latMin, :lonMax => lonMax, :lonMin => lonMin})
	end
   
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stations }
    end
  end

  # GET /stations/1
  # GET /stations/1.xml
  def show
    @station = Station.find(params[:id])
	
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @station }
    end
  end

  # GET /stations/new
  # GET /stations/new.xml
  def new
    @station = Station.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @station }
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
