class EvOwnersController < ApplicationController
  skip_before_filter  :authorize
  
  # GET /ev_owners
  # GET /ev_owners.xml
  def index
    @ev_owners = EvOwner.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ev_owners }
    end
  end

  # GET /ev_owners/1
  # GET /ev_owners/1.xml
  def show
    @ev_owner = EvOwner.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ev_owner }
    end
  end

  # GET /ev_owners/new
  # GET /ev_owners/new.xml
  def new
    @ev_owner = EvOwner.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ev_owner }
    end
  end

  # GET /ev_owners/1/edit
  def edit
    @ev_owner = EvOwner.find(params[:id])
  end

  # POST /ev_owners
  # POST /ev_owners.xml
  def create
    @ev_owner = EvOwner.new(params[:ev_owner])

    respond_to do |format|
      if @ev_owner.save
        format.html { redirect_to(@ev_owner, :notice => 'Ev owner was successfully created.') }
        format.xml  { render :xml => @ev_owner, :status => :created, :location => @ev_owner }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ev_owner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ev_owners/1
  # PUT /ev_owners/1.xml
  def update
    @ev_owner = EvOwner.find(params[:id])

    respond_to do |format|
      if @ev_owner.update_attributes(params[:ev_owner])
        format.html { redirect_to(@ev_owner, :notice => 'Ev owner was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ev_owner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ev_owners/1
  # DELETE /ev_owners/1.xml
  def destroy
    @ev_owner = EvOwner.find(params[:id])
    @ev_owner.destroy

    respond_to do |format|
      format.html { redirect_to(ev_owners_url) }
      format.xml  { head :ok }
    end
  end
end
