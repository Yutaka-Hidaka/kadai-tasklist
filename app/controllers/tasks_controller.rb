class TasksController < ApplicationController
   before_action :set_message, only: [:show, :edit, :update, :destroy]
  def index
  @tasks = Task.all
  end

  def show
  end

  def new
  @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:success] = 'タスクが正常に投稿されました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスクが正常に投稿されません'
      render :new
    end
  end

  def edit
  end

  def update

    if @task.update(task_params)
      flash[:success] = 'タスクが編集されました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスクが編集されませんでした'
      render :new
    end
  end

  def destroy
    @task.destroy
  
    flash[:success] = 'タスクが削除されました'
    redirect_to tasks_path
  end
  
  private
  
  def set_message
      @task = Task.find(params[:id])
  end
  # Strong Parameter
  def task_params
  params.require(:task).permit(:content, :status)
  end
  
end

