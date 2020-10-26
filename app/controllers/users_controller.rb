class UsersController < ApplicationController
    # skip_before_action :require_valid_user!

    def new
        @user = User.new   
    end 

    def create
        @user = User.new(user_params)
        if @user.save 
            redirect_to repos_url, notice: 'Thanks you for signing up!' 
        else  
            render :new 
        end  
    end 

    protected 

    def after_sing_up_path_for(resource)
        repos
    end 

    private  

    def user_params 
        params.require(:user).permit(:username, :email, :password, :avatar)
    end 
end
