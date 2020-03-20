Rails.application.routes.draw do
  get 'events/show'

	root to: "groups#index"
  devise_for :users
  resources :groups do
  get 'adduser'
  resources :candidates do
  end 
  	resources :articles do
  		resources :articlescoments
  	end
  	resources :events do
  	end
  end

  get "/groups/:group_id/enter/:id", to: "enter#create", as: "enter" 
  delete "/groups/:group_id/enter/:id", to: "enter#destroy" 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
