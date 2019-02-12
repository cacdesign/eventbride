class UsersController < ApplicationController

	before_action :authenticate_user!, only: [:show]
	before_action :good_profile, only: [:show]

  def show
  	puts "&" * 24
  	puts @events = current_user.events_created
  end

  def good_profile

  	if current_user.id != params[:id]
  		#redirect_to events_path
  	end
  end

end
