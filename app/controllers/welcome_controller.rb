class WelcomeController < ApplicationController
  skip_before_filter  :authorize
  
  def index
  puts '23'
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  
end
