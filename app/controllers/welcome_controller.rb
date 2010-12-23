class WelcomeController < ApplicationController
  skip_before_filter  :authorize
  
end
