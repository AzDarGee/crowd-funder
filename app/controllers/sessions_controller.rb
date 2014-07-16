class SessionsController < ApplicationController
  def new
    #Grab the template - Login form
  end
  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_back_or_to root_path, flash: { :notice => "Logged In!" }
    else
      flash.now[:alert] = "Could not log in. Try again!"
      render :new
    end
  end
  def destroy
    logout
    redirect_to root_path, :notice => "Logged Out!"
  end
end
