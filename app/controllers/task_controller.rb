class TaskController < ApplicationController
  before_action :find_user, only:[:new, :create, :show, :edit, :destroy]

  def index
    @tasks = Task.all
  end
  
  def new
    @task = Task.new
  end

  def create
    @task = @user.tasks.new(task_params)
    if @task.save
      flash[:success] = "Task successfully created"
      redirect_to user_path(@user.id)
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def show;end

  def edit
    if @task.update(task_params)
      redirect_to user_path(@task.user)
    else
      render :edit
    end
  end
  
  def destroy
    if @task.destroy
      flash[:success] = 'Task was successfully deleted.'
      redirect_to tasks_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to tasks_url
    end
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def task_params
    params.require(:task).permit(:title, :content, :tag, :priority, :status)
  end
  
end
