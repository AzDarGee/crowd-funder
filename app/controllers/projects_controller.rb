class ProjectsController < ApplicationController
    # Before you do anything, check to see if logged in, if not logged in, only has access to 'index' and 'show'
    before_action :require_login, :except => [:index, :show]
    load_and_authorize_resource

    def index
      @projects = Project.all

      respond_to do |format|
        format.html
        format.js
      end
    end
    def new
    end
    def show
        @breakpoints = @project.breakpoints
        @commentable = @project
        @comments = @commentable.comments
        @comment = Comment.new
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
