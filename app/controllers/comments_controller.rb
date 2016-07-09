class CommentsController < ApplicationController
  before_action :require_sign_in
  before_action :authorize_user, only: [:destroy]


  def create
    if params[:post_id]
      @commentable = Post.find(params[:post_id])
    elsif params[:topic_id]
      @commentable = Topic.find(params[:topic_id])
    end

    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Comment was saved succesffully."
    else
      flash[:alert] = "Comment couldn't be saved. Try again."
    end
    redirect_to :back
  end


  def destroy
    @comment = Comment.find(params[:id])

    if comment.destroy
      flash[:notice] = "Comment was deleted succesffully."
      redirect_to :back
    else
      flash[:alert] = "Comment couldn't be deleted. Try again."
      redirect_to :back
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def authorize_user
    comment = Comment.find(params[:id])
    unless current_user == comment.user || current_user.admin?
      flash[:alert] = "You don't have permission to delete the comment."
      redirect_to [comment.post.topic, comment.post]
    end
  end
end
