class GitHubUsersController < ApplicationController
  before_action :set_git_hub_user, only: %i[show destroy]

  def index
    @git_hub_users = GitHubUser.all
  end

  def show
    return unless @git_hub_user.repos.present?

    @total_stars = @git_hub_user.repos.sum(:stargazers_count)
    @watchers_count = @git_hub_user.repos.sum(:watchers_count)
    @forks_count = @git_hub_user.repos.sum(:forks_count)
    @open_issues_count = @git_hub_user.repos.sum(:open_issues_count)
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

  def compare_users
    @user_one = GitHubUser.find(params[:id1])
    @user_two = GitHubUser.find(params[:id2])
  end

  def destroy
    @git_hub_user.destroy
    redirect_to root_path
  end

  private

  def set_git_hub_user
    @git_hub_user = GitHubUser.includes(:repos).find(params[:id])
  end

  def git_hub_user_params
    git_hub_user_params = params.require(:username).permit(:login, :name, :avatar_url, :public_repos, :followers, :following, :created_at) # rubocop:disable Layout/LineLength
    git_hub_user_params[:username] = git_hub_user_params.delete :login
    git_hub_user_params[:since] = git_hub_user_params.delete :created_at
    git_hub_user_params
  end
end
