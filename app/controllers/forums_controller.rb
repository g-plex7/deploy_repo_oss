class ForumsController < ApplicationController
    before_action :set_forum, only: [:show, :edit, :update, :destroy]
    before_action :logged_in?, except: [:index]

    def index
        @forums = Forum.all  
    end 

    def new  
        @repo = Repo.new 
    end 

    def create  
        @forum = Forum.new(forum_params)

        if @forum.save 
            redirect_to @forum 
        else 
            render :new 
        end 
    end 

    def update 
        if @forum.update(forum_params)
            redirect_to @forum 
        else 
            render :edit 
        end 
    end 

    def destroy
        @forum.destroy  
        redirect_to forums_url, notice: 'forum successfuly delete'  
    end 

    private  

    def set_forum
        @forum = Forum.find(params[:id]) 
    end 

    def forum_params
        params.require(:forum).pemrit(:title, :question, :tag_list)
    end 
end
