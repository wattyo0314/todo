class TasksController < ApplicationController
  before_action :set_list

  def new
    @task = Task.new
    @list = List.find_by(id: params[:list_id])
  end

  def create
    @task = @list.tasks.new(task_params)
    if  @task.save
      redirect_to root_path(@list),  notice: 'タスクが追加されました'
    else
      @tasks = @list.tasks.includes(:user)
      flash.now[:alert] = "必要事項を入力してください"
      render :new
    end
  end

  def edit
    @task = @list.tasks.find(params[:id])
  end

  def update
    @task = @list.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to root_path(@list), success: "リストを更新しました"
    else
      render :edit, alert: "リストを更新できませんでした"
    end
  end

  def show
    @task = @list.tasks.find_by(id: params[:id])
  end

  def destroy
    @list.tasks.find(params[:id]).destroy
    redirect_to root_path, success: "タスクを削除しました"
  end

  private
  def task_params
    params.require(:task).permit(:title, :memo, :time).merge(user_id: current_user.id)
  end

  def set_list
    @list = List.find(params[:list_id])
  end

end
