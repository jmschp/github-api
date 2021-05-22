class CreateRepos < ActiveRecord::Migration[6.1]
  def change
    create_table :repos do |t|
      t.string :name, null: false
      t.boolean :fork, null: false
      t.text :description
      t.string :clone_url, null: false
      t.integer :size, null: false
      t.integer :stargazers_count, null: false, default: 0
      t.integer :watchers_count, null: false, default: 0
      t.integer :forks_count, null: false, default: 0
      t.integer :open_issues_count, null: false, default: 0
      t.string :language, null: false
      t.references :git_hub_user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
