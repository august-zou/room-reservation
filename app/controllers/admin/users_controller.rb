class Admin::UsersController < ApplicationController
  def index
    @users = User.paginate(:page => params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "您已注册成功，请等待管理员审核"
      redirect_to admin_users_path
    else
      render 'new' 
    end
  end

  def set_admin
    user = User.find(params[:id])
    user.is_admin = !user.is_admin
    if user.save
      flash[:success] = "设置成功"
    else
      flash[:success] = "设置失败"
    end
    redirect_to admin_users_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "用户信息更新成功"
      redirect_to admin_users_path
    else
      render 'edit' 
    end
  end

  def destroy
    @user=User.find(params[:id])
    if @user.destroy
      flash[:success] = "你已删除本条预约记录"
    else
      flash[:danger] = "删除失败"
    end
    redirect_to admin_users_path
  end

  private
  def user_params
    permited = params.required(:user).permit(:name, :password, :password_confirmation,:real_name,:email,:phone)
  end
end
