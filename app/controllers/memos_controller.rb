class MemosController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @memos = Memo.order("created_at DESC").page(params[:page]).per(6)
  end

  def new
    @memo = Memo.new
  end

  def create
    @memo = Memo.create(memo_params)
  end

  private
  def memo_params
    params.require(:memo).permit(:name, :text, :image)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end