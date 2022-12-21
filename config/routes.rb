Rails.application.routes.draw do
  devise_for :users
  resources :projects do
  	resources :workshops do
  		resources :workshop_activities
  	end
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
