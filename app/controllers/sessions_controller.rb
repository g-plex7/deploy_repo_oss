class SessionsController < ApplicationController
  def new
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
