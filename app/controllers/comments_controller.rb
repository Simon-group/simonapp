class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: comment_params[:text], video_id: comment_params[:video_id], user_id: current_user.id)
    respond_to do |format|
      format.html { redirect_to video_path(params[:video_id])  }
      format.json
    end
  end

  private
  def comment_params
    params.permit(:text, :video_id)
  end
end
