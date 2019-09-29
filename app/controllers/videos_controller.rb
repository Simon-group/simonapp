class VideosController < ApplicationController

  before_action :move_to_index, except: [:index, :show]

  def index
    @videos = Video.order("created_at DESC").page(params[:page]).per(5).search(params[:search])
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.create(name: video_params[:name], image: video_params[:image], text: video_params[:text], user_id: current_user.id)
    if @video.save
      redirect_to root_path, notice: '動画の投稿に成功しました！'
    else
      flash.now[:notice] = '動画の投稿に失敗しました.....'
      render :new
    end
  end

  def destroy
    video = Video.find(params[:id])
    if video.user_id == current_user.id
      video.destroy
    end
    redirect_to root_path, notice: '投稿の削除に成功しました！'
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    video = Video.find(params[:id])
    if video.user_id == current_user.id
      video.update(video_params)
      redirect_to root_path, notice: '投稿の編集に成功しました！'
    end
  end

  def show
    @video = Video.find(params[:id])
    @comments = @video.comments.includes(:user)
    @comments = Comment.all.reverse_order
    @like = Like.new
  end

  private
  def video_params
    params.require(:video).permit(:name, :text, :image)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
