class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]
  before_action :set_article
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy, :update]
  respond_to :html

  # def index
  #   redirect_to @article
  # end

  # def show
  #   redirect_to @article
  # end

  # def new
  #   @comment = Comment.new
  #   respond_with(@comment)
  # end

  def edit
  end

  def create
    @comment = @article.comments.create(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:success] = "Comment successfully created!"
    else
      flash[:warning] = "Comment cannot be blank."
    end
    redirect_to @article
  end

  # def update
  #   @comment.update(comment_params)
  #   respond_with(@comment)
  # end

  def destroy
    if @comment
      @comment.destroy
      flash[:success] = "Comment has been successfully deleted."
    end
    redirect_to @article
  end

  private
  
    def set_article
      @article = Article.find(params[:article_id])
    end
  
    # For all controller methods besides 'new' and 'create', the variable @comment
    # is unset. This method prevents external POST requests from deleting arbitrary comments,
    # as a comment to-be-deleted must be verified as belonging to the current_user
    def set_comment
      @comment = current_user.comments.find_by_id(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :user_id)
    end
end
