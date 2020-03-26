# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'groups#index'
  devise_for :users

  resources :groups do
    get 'adduser'
    get 'people'
    resources :candidates do
    end
    resources :articles do
    end
    resources :events do
    end
  end
  resources :comments

  # get "/groups/:group_id/people", to: "groups#people", as: "groups"
  get "/groups/:group_id/enters/:id", to: "enters#create", as: "enters"
  delete "/groups/:group_id/enters/:id", to: "enters#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
