Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'git_hub_users#index'

  resources :git_hub_users, only: %i[show create destroy] do
    resource :repo, only: %i[create]
  end

  get '/compare_users/:id1/:id2', to: 'git_hub_users#compare_users'
end
