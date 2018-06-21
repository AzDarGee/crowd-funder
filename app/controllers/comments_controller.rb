class CommentsController < ApplicationController

  before_filter :load_commentable,:load_user,:load_project

  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    if @comment.save
      redirect_to @commentable, flash: { notice: "Successfully added comment." }
    else
      flash.now[:alert] = "Could not add the comment. Try again."
      render :new
    end
  end

  def show
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

    def load_commentable
      if params[:project_id]
        id = params[:project_id]
        @commentable = Project.find(params[:project_id])
      end
    end

    def comment_params
      params.require(:comment).permit(:content)
    end

    def load_project
      @project = Project.find(params[:project_id]) if params[:project_id]
    end

    def load_user
      @user = User.find(params[:user_id]) if params[:user_id]
    end

end
