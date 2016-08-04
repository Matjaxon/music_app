class SessionsController < ApplicationController

  def new
    @user ||= User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if @user
      login_user!(@user)
      redirect_to bands_url
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << "Email and Password do not match"
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

end
