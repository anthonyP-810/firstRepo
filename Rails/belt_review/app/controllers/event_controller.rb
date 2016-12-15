class EventController < ApplicationController
  def index
	@user = User.find(session[:user_id])
	@events = Event.where("state = ?", "#{@user.state}").includes(:users)
	@all_events = Event.where.not(state: "#{@user.state}")
	if !@user
		redirect_to user_index
	end
  end

  def create
  puts "#{session[:user_id]}"
	event = Event.new(title: post_params[:title], date: post_params[:date], city: post_params[:city], state: post_params[:state], user: User.find(session[:user_id]))
	if event.valid?
		event.save
		redirect_to '/events'
	else
		flash[:message] = 'Oops, something went wrong!'
		redirect_to '/events'
	end
  end

  def join
	event = EventAttendee.new(event: Event.find(params[:id]), user: User.find(session[:user_id]))
	if event.valid?
		event.save
		redirect_to '/events'
	else 
		flash[:message] = 'Join event failed'
		redirect_to '/events'
	end
  end

  def edit
  end

  def delete
  end

  private
  def post_params
	params.require(:event).permit(:title, :date, :city, :state)
  end
end
