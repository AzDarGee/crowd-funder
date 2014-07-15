class ProjectsController < ApplicationController
    def index
      @projects = Project.all
    end
    def new
    	# so we can use form_for instead of form_tag
    	@project = Project.new
    end
    def create
    	@project = Project.new(project_params)
    	if @project.save
    		redirect_to root_path, flash: { notice: 'Project Created!' }
    	else
    		flash.now[:alert] = 'Could not create your project, try again!'
    		render :new
    	end
    end
    def edit
    	@project = Project.find(params[:id])
    end
    def destroy
    	@project = Project.find(params[:id])
    	@project.destroy
    	redirect_to root_path, flash: { notice: 'Deleted project!' }
    end
    private
    def project_params
    	params.require(:project).permit(:title,:description,:funding_goal,:funds_raised,:start_date,:end_date)
    end
end
