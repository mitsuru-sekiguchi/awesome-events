Rails.application.routes.draw do
  namespace :admin do
    get 'users/index'
    get 'users/destroy'
  end
  get 'users/list'
  root 'welcome#index'
  get "/auth/:provider/callback" => "sessions#create"
  delete "/logout" => "sessions#destroy", as: :logout

  resources :users, only: [:show, :edit]

  resources :retirements

  resources :events, only: %i[new create show edit update destroy] do
    resources :tickets, only: %i[new create destroy]
  end
  get 'status' => 'status#index', defaults: { format: 'json'}

  # match "*path" => "application#error404", via: :all
end
