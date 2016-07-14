class Api::V1::CommentsController < Api::V1::BaseController
  before_action :authenticate_user
  before_action :authorize_user

  def show
    comment = Comment.find(params[:id])
    render json: comment.to_json, status: 200
  end

  def index
    comments = Comment.all
    render json: comments.to_json, status: 200
  end
end
