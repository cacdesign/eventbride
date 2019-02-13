class ParticipationsController < ApplicationController
  def index
  	puts @event = Event.find(params[:event_id])
  end
end
