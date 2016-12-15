class UserController < ApplicationController
  def index
	
  end

  def create
	user = User.new(post_params)
	if user.valid?
		user.save
		session[:user_id] = user.id
		redirect_to '/events'
	else
		flash[:message] = "Invalid credentials: Please try again!"
		redirect_to '/'
	end
  end

  def edit
  end

  def update
  end

  private
  def post_params
	params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)
  end
end
