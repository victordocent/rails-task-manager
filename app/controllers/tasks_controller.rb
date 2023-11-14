class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create # POST /tasks
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task = Task.update(set_task)
    redirect_to tasks_path()
  end

  private

  def set_task
    params.require(:task).permit(:title, :details, :completed)
  end

  def task_params
    params.require(:task).permit(:title, :details)
  end

end
