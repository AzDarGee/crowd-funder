class CommentsController < ApplicationController


  before_action :load_project, :load_user



  def index
    @commentable = find_commentable
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(comment_params)
    @comments = @commentable.comments
    if @comment.save
      redirect_to @commentable, flash: { notice: "Successfully added comment." }
    else
      flash.now[:alert] = "Could not add the comment. Try again."
      render :new
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

    def find_commentable
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
      nil
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
