class UsersController < ApplicationController
  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "您已注册成功，请等待管理员审核"
      redirect_to root_path
    else
      render 'new' 
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "用户信息更新成功"
      redirect_to roots_path
    else
      render 'edit' 
    end
  end

  def destroy
  end

  private
  def user_params
    permited = params.required(:user).permit(:name, :password, :password_confirmation,:real_name,:email,:phone)
  end
end
