class TasksController < ApplicationController
  before_action :set_list
  def index
  @tasks = @list.tasks.includes(:user)
  end

  def new
    @task = Task.new
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

  private
  def task_params
    params.require(:task).permit(:title, :memo, :time, :finished).merge(user_id: current_user.id)
  end

  def set_list
    @list = List.find(params[:list_id])
  end

end
