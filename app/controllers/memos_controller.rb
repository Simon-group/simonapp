class MemosController < ApplicationController

  def index
    @memos = Memo.all
  end

  def new
    @memo = Memo.new
  end

  def create
    @memo = Memo.create(memo_params)
  end

  private
  def memo_params
    params.require(:memo).permit(:image)
  end

end