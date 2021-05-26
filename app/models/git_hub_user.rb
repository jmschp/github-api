class GitHubUser < ApplicationRecord
  has_many :repos, dependent: :destroy

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :public_repos, presence: true, numericality: :only_integer
  validates :followers, presence: true, numericality: :only_integer
  validates :following, presence: true, numericality: :only_integer
end
