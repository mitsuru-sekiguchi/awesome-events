Rails.application.routes.draw do
  root 'welcome#index'
  get "/auth/:provider/callback" => "sessions#create"
  delete "/logout" => "sessions#destroy", as: :logout

  resources :user_informations, only: [:new, :show, :create, :edit, :update] do
    get :list, on: :collection
  end

  resources :retirements

  resources :events, only: %i[new create show edit update destroy] do
    resources :tickets, only: %i[new create destroy]
  end
  # get 'status' => 'status#index', defaults: { format: 'json'}

  # match "*path" => "application#error404", via: :all
end
