class EventsController < ApplicationController

before_action :authenticate_user!, only: [:new]
before_action :good_admin, only: [:edit, :update, :destroy]

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

  def edit
	@id = params[:id]
  	@event = Event.find(@id)
  end

  def update

  	@event = Event.find(params[:id])
  	post_params_update = params.require(:event).permit(:start_date, :duration, :description, :price, :location, :title)
        if @event.update(post_params_update) 
          flash[:success] = "Event updated"
          redirect_to event_path(@event)
      
        else
          flash[:error] = @event.errors.details
          render 'edit'
        end
  end

  def destroy
  	@event = Event.find(params[:id])
  	@event.attendances.each do |attendance|
  		attendance.destroy
  	end
  	@event.destroy
  	redirect_to events_path
  end


private

  def post_params
  	params[:event]
  end


  def good_admin
  	@id = params[:id]
  	@event = Event.find(@id)
  	if current_user != @event.admin
	  	flash[:error] = "You're not the admin"
	    redirect_to event_path(@event)
    end
  end

end

