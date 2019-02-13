class EventsController < ApplicationController

before_action :authenticate_user!, only: [:new]

  def index
  	@events = Event.all
  end

  def new

  end

  def show
  	@id = params[:id]
  	@event = Event.find(@id)
  end

  def create
  	e = Event.new(start_date: post_params[:start_date], duration: post_params[:duration], description: post_params[:description], price:post_params[:price], location: post_params[:location], admin: current_user, title: post_params[:title])
  		if e.save
  			flash[:success] = "Event created"
  			redirect_to event_path(e)
  		else
  			flash[:error] = "Remplis moi ce formulaire Feignasse"
  			render 'new'
  		end
  end




private

  def post_params
  	params[:event]
  end


end

