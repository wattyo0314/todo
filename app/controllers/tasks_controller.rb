class TasksController < ApplicationController
  def index
  @task = Task.all
  end
  def new
    @tasks = Task.new
  end

  def create
    @task = Tasks.new(task_params)
  end

  private
  def task_params
    params.require(:task).permit(:name, :title, :deadline)
  end

end
