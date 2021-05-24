class GitHubUsersController < ApplicationController
  def index
    @git_hub_users = GitHubUser.all
  end

  def create
    git_hub_user = GitHubUser.new(git_hub_user_params)
    # binding.pry
    if git_hub_user.save
      render json: git_hub_user, status: 201
    else
      render json: git_hub_user.errors.messages, status: 409
    end
  end

  def git_hub_user_params
    git_hub_user_params = params.require(:username).permit(:login, :name, :avatar_url, :public_repos, :followers, :following, :created_at)
    git_hub_user_params[:username] = git_hub_user_params.delete :login
    git_hub_user_params[:since] = git_hub_user_params.delete :created_at
    git_hub_user_params
  end
end
