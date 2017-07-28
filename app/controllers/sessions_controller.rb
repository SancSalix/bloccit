class SessionsController < ApplicationController
  def new
  end
 
  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      create_session(user)
      if params[:remember_me]
        cookies.signed[:user.id] = { value: user.id, expires: 2.weeks.from_now }
      else
        cookies.signed[:user_id] = user.id
      end
      flash[:notice] = "Welcome, #{user.name}!"
      redirect_to root_path
    else
      flash.now[:alert] = 'Invalid email/password combination'
      render :new
    end
  end
 
  def destroy
    destroy_session(current_user)
    flash[:notice] = "You've been signed out, come back soon!"
    redirect_to root_path
  end
end
