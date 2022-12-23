Rails.application.routes.draw do
  devise_for :users
  resources :projects do
  	resources :workshops do
  		resources :workshop_activities
  	end
  end

  get :get_options, to: 'workshop_activities#get_options'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
