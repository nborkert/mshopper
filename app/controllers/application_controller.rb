class ApplicationController < ActionController::Base
  before_filter  :authorize 
  protect_from_forgery
  
   
  protected
    def authorize
	  unless Client.find_by_userid(session[:userid])
	    redirect_to login_url, :notice => 'Please log in.'
	  end
    end
end
