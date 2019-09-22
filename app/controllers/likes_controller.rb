class LikesController < ApplicationController
  before_action :set_variables
  def like
    @like = current_user.likes.new(video_id: @video.id)
    @like.save
  end

  def unlike
    @like = current_user.likes.find_by(video_id: @video.id)
    @like.destroy
  end

  private

  def set_variables
    @video = Video.find(params[:video_id])
    @id_name = "#like-link-#{@video.id}"
    @id_heart = "#heart-#{@video.id}"
  end
  
end
