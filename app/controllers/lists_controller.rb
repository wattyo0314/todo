class ListsController < ApplicationController

  def index
    @lists =List.includes(:user).order("created_at ASC")
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
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to root_path, success: "リストを更新しました"
    else
      render :edit, alert: "リストを更新できませんでした"
    end
  end

  def destroy
    List.find(params[:id]).destroy
    redirect_to root_path, success: "リストを削除しました"
  end


  private
  def list_params
    params.permit(:title).merge(user: current_user)
  end
end