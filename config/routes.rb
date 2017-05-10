Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "sessions" }
  root to: 'questions#index'

  get 'auth/github/callback' => 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy'

  resources :answers, only: [:update]
  resources :questions, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :answers, only: [:new, :create] do
      member do
        post 'upvote'
      end
    end
  end
end
