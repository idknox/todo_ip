class SessionsController < ApplicationController
  skip_before_action :ensure_current_user

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @user = User.new(email: params[:user][:email])
      @user.errors[:base] << "Login failed"
      render partial: 'homepage/login', locals: {user: @user}
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end