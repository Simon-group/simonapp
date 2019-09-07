class UsersController < ApplicationController
  def show
    @name = current_user.name
    @videos = Memo.where(user_id: current_user.id).page(params[:page]).per(5).order("created_at DESC")
  end
end
