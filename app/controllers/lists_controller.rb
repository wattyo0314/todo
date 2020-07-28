class ListsController < ApplicationController
  def index
    @lists = List.all.includes(:user)
  end

  def new 
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path, success: "リストを登録しました。"
    else
      render :new
    end
  end

  private
  def list_params
    params.permit(:title).merge(user: current_user)
  end
end