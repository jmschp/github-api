class GitHubUser < ApplicationRecord
  has_many :repos
end
