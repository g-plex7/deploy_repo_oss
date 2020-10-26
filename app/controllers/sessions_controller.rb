class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password]) 
      session[:user_id] = @user.id 
      redirect_to repos_url, notice: 'Logged in!'
    else 
      flash.now.alert = 'Email or password is invalid'
      render :new 
    end 
  end 

  def callback 
    @user = User.from_omniauth(request.env['omniauth.auth']) 
      session[:user_id] = @user.id 
      redirect_to repos_url 
  end 

  def destroy
    session.delete(:user_id) 
    redirect_to repos_url, notice: 'Logged out!'
  end 
end
