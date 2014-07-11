class UsersController < ApplicationController
    def new
      @user = User.new(user_params)
      if @user.save
        redirect_to root_path, flash: { notice: '#{@user.user-name} signed up successfully!' }
      else
        flash.now[:alert] = 'Could not sign you up, refresh and try again!'
        render :new
      end
    end
    private
    def user_params
      params.require(:user).permit(:user_name,:email,:password,:password_digest)
    end
end
