class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "您已注册成功，请等待管理员审核"
      redirect_to users_path
    else
      render 'new' 
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    permited = params.required(:user).permit(:name, :password, :password_confirmation)
  end
end
