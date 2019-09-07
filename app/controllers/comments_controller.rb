class CommentsController < ApplicationController
  def create
    comment = Comment.create(text: comment_params[:text], video_id: comment_params[:video_id], user_id: current_user.id)
    redirect_to "/videos/#{comment.video.id}"   #コメントと結びつくツイートの詳細画面に遷移する
  end

  private
  def comment_params
    params.permit(:text, :video_id)
  end
end
