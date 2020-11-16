class ReposController < ApplicationController
  before_action :set_repo, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?, except: [:index]

  def index
    @repos = Repo.all 
  end

  def new  
    @client = Octokit::Client.new
    @user =  @client.user(current_user.uid)
    @repos = @client.repos(@user.login, query: { type: 'owner', sort: 'asc' })
  end 

  def create
    @repo = current_user.repos.build(repo_params)

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
    params.require(:repo).permit(:public_repo, :judul, :repo_information, :user_id)
  end 
end
