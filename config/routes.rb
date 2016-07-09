Rails.application.routes.draw do
resources :labels, only: [:show]
  resources :topics do
    resources :posts, except: [:index]
  end

  resources :posts, only: [] do
    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
  end

  post '/up-vote' => 'votes#up_vote', as: :up_vote
  post '/down-vote' => 'votes#down_vote', as: :down_vote

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  get 'about' => 'welcome#about'

  root 'welcome#index'
end
