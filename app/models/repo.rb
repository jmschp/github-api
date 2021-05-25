class Repo < ApplicationRecord
  belongs_to :git_hub_user

  validates :name, uniqueness: { scope: :git_hub_user_id, case_sensitive: false }
end
