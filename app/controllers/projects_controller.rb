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
        @project = current_user.projects.build
    end
    def show
        @breakpoints = @project.breakpoints
        @commentable = @project
        @comments = @commentable.comments
        @comment = Comment.new
    end
    def create
        @project = current_user.projects.build(project_params)
    	if @project.save
            UserMailer.project_email(current_user,@project).deliver
    		redirect_to root_path, flash: { notice: 'Project Created!' }
    	else
    		flash.now[:alert] = 'Could not create your project, try again!'
    		render :new
    	end
    end
    def edit
        @project = Project.find(params[:id])
    end
    def update

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
