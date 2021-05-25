class ReposController < ApplicationController
  def create
    git_hub_user = GitHubUser.find(params[:git_hub_user_id])
    uri = URI("https://api.github.com/users/#{git_hub_user.username}/repos")
    req = Net::HTTP::Get.new(uri)
    req['accept'] = 'application/vnd.github.v3+json'
    res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(req)
    end
    git_hub_user_repos = JSON.parse(res.body)
    git_hub_user_repos.each do |repo|
      repo_attributes = repo.slice('name', 'fork', 'description', 'clone_url', 'size', 'stargazers_count', 'watchers_count', 'forks_count', 'open_issues_count', 'language')
      user_repo = Repo.new(repo_attributes)
      user_repo.git_hub_user = git_hub_user
      user_repo.save
    end
    redirect_to request.referer
  end
end
