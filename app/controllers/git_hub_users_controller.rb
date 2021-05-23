class GitHubUsersController < ApplicationController
  def index
    @git_hub_users = GitHubUser.all
  end

  def create
    # byebug
    new_git_hub_user = GitHubUser.new(git_hub_user_params)
    if new_git_hub_user.save
      redirect_to git_hub_users_path
    else
      redirect_to :index
    end
  end

  def git_hub_user_params
    git_hub_user = params.require(:username).permit(:login, :name, :avatar_url, :public_repos, :followers, :following, :created_at)
    git_hub_user[:username] = git_hub_user.delete :login
    git_hub_user[:since] = git_hub_user.delete :created_at
    git_hub_user
  end
end
