class UserController < ApplicationController

  before_action :find_user, only:[:show, :edit, :destroy]

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def show;end
  

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User successfully created"
      redirect_to user_index_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def edit
    @user.update(user_params)
  end

  def destroy
    @user.destroy
    redirect_to :index
  end
  
  private

  def user_params
    params.require(:user).permit(:name)
  end
  
  def find_user
    @user = User.find(params[:id])
  end
end
