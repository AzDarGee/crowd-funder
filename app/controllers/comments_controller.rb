class CommentsController < ApplicationController
  before_action :load_commentable

  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.build(params[:comment])
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

    def load_commentable
      resource, id = request.path.split('/')[1,2]
      @commentable = resource.singularize.classify.constantize.find(id)
    end

end
