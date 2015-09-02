class LikesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @likes = @user.likes
    @likes = @likes.where(omdb_id: params[:omdb_id]) if params[:omdb_id]

    render json: @likes, status: :ok
  end

  def create
    @user = User.find(params[:user_id])
    @like = @user.likes.create(omdb_id: params[:like][:omdb_id], title: params[:like][:title])

    render json: @like
  end

  def destroy
    @user = User.find(params[:user_id])
    @like = @user.likes.find_by(omdb_id: params[:id])

    if @like
      @like.destroy
      render json: { message: "Deleted" }, status: :no_content
    else
      render json: { message: "Cannot delete" }, status: :bad_request
    end
  end
end
