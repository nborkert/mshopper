class ReferrersController < ApplicationController
  skip_before_filter  :authorize
  
  
  # GET /referrers
  # GET /referrers.xml
  def index
    @referrers = Referrer.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @referrers }
    end
  end

  # GET /referrers/1
  # GET /referrers/1.xml
  def show
    @referrer = Referrer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @referrer }
    end
  end

  # GET /referrers/new
  # GET /referrers/new.xml
  def new
    @referrer = Referrer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @referrer }
    end
  end

  # GET /referrers/1/edit
  def edit
    @referrer = Referrer.find(params[:id])
  end

  # POST /referrers
  # POST /referrers.xml
  def create
    @referrer = Referrer.new(params[:referrer])

    respond_to do |format|
      if @referrer.save
        format.html { redirect_to(@referrer, :notice => 'Referrer was successfully created.') }
        format.xml  { render :xml => @referrer, :status => :created, :location => @referrer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @referrer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /referrers/1
  # PUT /referrers/1.xml
  def update
    @referrer = Referrer.find(params[:id])

    respond_to do |format|
      if @referrer.update_attributes(params[:referrer])
        format.html { redirect_to(@referrer, :notice => 'Referrer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @referrer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /referrers/1
  # DELETE /referrers/1.xml
  def destroy
    @referrer = Referrer.find(params[:id])
    @referrer.destroy

    respond_to do |format|
      format.html { redirect_to(referrers_url) }
      format.xml  { head :ok }
    end
  end
end
