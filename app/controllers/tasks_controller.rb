class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(res_params)
    task.save

    redirect_to task_path(task)
  end

  def edit
  end

  def update
    task = Task.find(params[:id])
    task.update(res_params)

    redirect_to task_path(task)
  end

  def destroy
    @task.destroy

    redirect_to tasks_path
  end

  private

  def res_params
    params.require(:task).permit(:title, :details)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
