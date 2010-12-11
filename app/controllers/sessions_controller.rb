class SessionsController < ApplicationController
  skip_before_filter  :authorize 

  def new
  end

  def create
    if client = Client.authenticate(params[:userid], params[:password])
	  session[:userid] = client.userid
	  redirect_to clients_url+'/'+client.id.to_s
	else
	  redirect_to login_url, :alert => "Invalid userid/password combination"
	end
  end

  def destroy
    session[:userid] = nil
	redirect_to login_url, :alert => "Logged out"
  end

end
