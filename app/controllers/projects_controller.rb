class ProjectsController < ApplicationController
    # Before you do anything, check to see if logged in, if not logged in, only has access to 'index' and 'show'
    before_action :require_login, :except => [:index, :show]
    load_and_authorize_resource

    def index
      if params[:tag]
        @projects = Project.tagged_with(params[:tag]).order(:created_at)
      else
        @projects = Project.order(:created_at)
      end

      respond_to do |format|
        format.html
        format.js
      end
    end
    def new
    	# @project.breakpoints.build
    end
    def show
    end
    def create
    	if @project.save
    		redirect_to root_path, flash: { notice: 'Project Created!' }
    	else
    		flash.now[:alert] = 'Could not create your project, try again!'
    		render :new
    	end
    end
    def edit
    end
    def destroy
    	@project.destroy
    	redirect_to root_path, flash: { notice: 'Deleted project!' }
    end
    private
    def project_params
    	params.require(:project).permit(:title,:description,:funding_goal,:funds_raised,:start_date,:end_date,:image,breakpoints_attributes: [:id,:amount,:title,:description,:_destroy])
    end
end
