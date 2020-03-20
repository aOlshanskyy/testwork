# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'groups#index'
  devise_for :users
  resources :groups do
    get 'adduser'
    resources :candidates do
    end
    resources :articles do
    end
    resources :events do
    end
  end
  resources :comments

  get '/groups/:group_id/enter/:id', to: 'enter#create', as: 'enter'
  delete '/groups/:group_id/enter/:id', to: 'enter#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
