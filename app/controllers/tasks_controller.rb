class TasksController < ApplicationController
  before_action :set_list
  def index
  @task = Task.all
  end
  def new
    @tasks = Task.new
  end

  def create
    @task = Task.new(task_params)
    if  @task.save
      redirect_to root_path, success: "リストを登録しました。"
    else
      render :new
    end
  end

  private
  def task_params
    params.require(:task).permit(:name, :title, :deadline)
  end

  def set_list
    @list = List.find(params[:list_id])
  end

end
