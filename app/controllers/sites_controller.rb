class SitesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index]
  skip_before_action :authenticate_user!, only: [:index]
  
  def index
  	
  end
  def profile
		
	end
end
