class SessionsController < ApplicationController
  def new
  end

  def create
    if client = Client.authenticate(params[:userid], params[:password])
	  session[:userid] = client.userid
	  #puts client.id
	  redirect_to clients_url+'/'+client.id.to_s
	else
	  redirect_to login_url, :alert => "Invalid userid/password combination"
	end
  end

  def destroy
    session[:userid] = nil
	redirect_to clients_url, :notice => "Logged out"
  end

end
