class VideosController < ApplicationController

  before_action :move_to_index, except: [:index, :show]

  def index
    @videos = Video.order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.create(name: video_params[:name], image: video_params[:image], text: video_params[:text], user_id: current_user.id)
  end

  def destroy
    video = Video.find(params[:id])
    if video.user_id == current_user.id
      video.destroy
    end
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    video = Video.find(params[:id])
    if video.user_id == current_user.id
      video.update(video_params)
    end
  end

  def show
    @video = Video.find(params[:id])
    @comments = @video.comments.includes(:user)
  end

  private
  def video_params
    params.require(:video).permit(:name, :text, :image)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
