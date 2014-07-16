class ProjectOwnersController < ApplicationController
   def new
      @project_owner = ProjectOwner.new
    end
    def create
      @project_owner = ProjectOwner.new(project_owner_params)
      if @project_owner.save
        auto_login(@project_owner)
        redirect_to root_path, flash: { notice: "#{@project_owner.name} signed up successfully!" }
      else
        flash.now[:alert] = 'Could not sign you up, refresh and try again!'
        render :new
      end
    end
    def destroy
      @project_owner = ProjectOwner.find(params[:id])
      @project_owner.destroy
      redirect_to root_path, flash: { notice: 'Account Deleted!' }
    end
    private
    def project_owner_params
      params.require(:project_owner).permit(:name,:email,:password,:password_digest)
    end
end
