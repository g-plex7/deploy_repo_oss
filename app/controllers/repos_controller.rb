class ReposController < ApplicationController
  before_action :set_repo, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?, except: [:index]

  def index
    @repos = Repo.all 
  end

  def new  
    @repo = Repo.new
  end 

  def create
    @repo = Repo.new(repo_params)

    if @repo.save 
      redirect_to @repo
    else 
      render :new 
    end 
  end

  def update
    if @repo.update(repo_params)
      redirect_to @repo
    else 
      render :edit 
    end 
  end

  def destroy
    @repo.destroy 
    redirect_to repos_url, notice: 'repo successfuly destroy'
  end

  private 

  def set_repo 
    @repo = Repo.find(params[:id])
  end 

  def repo_params
    params.require(:repo).permit(:link, :judul, :repo_information)
  end 
end
