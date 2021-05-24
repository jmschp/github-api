class CreateGitHubUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :git_hub_users do |t|
      t.string :username, null: false
      t.string :name
      t.string :avatar_url
      t.integer :public_repos, null: false, default: 0
      t.integer :followers, null: false, default: 0
      t.integer :following, null: false, default: 0
      t.datetime :since, null: false

      t.timestamps
    end
  end
end
