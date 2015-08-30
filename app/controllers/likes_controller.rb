class LikesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @likes = @user.likes
    @likes = @likes.where(omdb_id: params[:omdb_id]) if params[:omdb_id]

    render json: @likes, status: :ok
  end

  def create
    @user = User.find(params[:user_id])
    @like = @user.likes.create(omdb_id: params[:like][:omdb_id])

    render json: @like
  end
end
