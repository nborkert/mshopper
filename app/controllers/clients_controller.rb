class ClientsController < ApplicationController
  skip_before_filter  :authorize, :only => [:index, :new, :create]
  
  
  # GET /clients
  # GET /clients.xml
  def index
    #@clients = Client.all
	@clients = Client.order(:userid)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @clients }
    end
  end

  # GET /clients/1
  # GET /clients/1.xml
  def show
    #if session[:userid] != nil
	 # puts "USERID found in session, searching by userid"
	 # @client = Client.find_by_userid(session[:userid])
	#else
	 # puts "No USERID in session"
	  @client = Client.find(params[:id])  
	#end
    #@client = Client.find_by_userid(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @client }
    end
  end

  # GET /clients/new
  # GET /clients/new.xml
  def new
    @client = Client.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @client }
    end
  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])
  end

  # POST /clients
  # POST /clients.xml
  def create
    @client = Client.new(params[:client])

    respond_to do |format|
      if @client.save
	    session[:userid] = @client.userid 
        #format.html { redirect_to(clients_url, :notice => 'Successfully created account.') }
		format.html { render :action => "show" }
        format.xml  { render :xml => @client, :status => :created, :location => @client }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @client.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /clients/1
  # PUT /clients/1.xml
  def update
    @client = Client.find(params[:id])

    respond_to do |format|
      if @client.update_attributes(params[:client])
        #format.html { redirect_to(clients_url, :notice => 'Successfully updated account.') }
		format.html { render :action => "show" }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @client.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.xml
  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    respond_to do |format|
      format.html { redirect_to(clients_url) }
      format.xml  { head :ok }
    end
  end
end
