class ListsController < ApplicationController
  before_action  :find_id, only: [:edit, :update]

  def index
    @lists = List.where(user: current_user).order("created_at ASC")
    @tasks = List.joins(:task).includes(:task).order("time ASC")
  end
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to root_path, success: "リストを登録しました。"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to root_path(@list), success: "リストを更新しました"
    else
      render :edit, warning: "リストを更新できませんでした"
    end
  end

  def destroy
    List.find(params[:id]).destroy
    redirect_to root_path, success: "リストを削除しました"
  end


  private
  def list_params
    params.require(:list).permit(:title).merge(user: current_user)
  end

  def find_id
    @list = List.find(params[:id])
  end
end