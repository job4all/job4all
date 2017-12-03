Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :searches
  resources :userskills
  resources :countries
  resources :states
  resources :advertises do
    resources :jobs
  end
  resources :experiences
  resources :educations
  resources :organizations
  resources :professions
  resources :degrees
  resources :institutes
  resources :cities
  devise_for :users
   resources :users do
  member do
    get "edit_profile"
    get "show_profile"
    get "panal"
    put :update_profile
  end
end

  root 'home#index'
  get 'about' => 'home#aboutus'
  get 'contact' => 'home#contact'
  get 'home/home' 
  get 'home/contact'  
  
  get ':id', to: 'home#show'
  
  #toegevoegd
  # error pages
  %w( 404 422 500 503 ).each do |code|
    get code, :to => "errors#show", :code => code
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
