class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash[:success] = "欢迎你！#{user.name}"
      redirect_to root_path
    else
      flash[:danger] = "登录信息错误"
      render 'new'
    end
  end

  def destroy
  end
end
