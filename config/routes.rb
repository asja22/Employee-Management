Rails.application.routes.draw do

  
  
  root 'pages#home'
  get 'help', to: 'pages#help'
  get 'contact', to: 'pages#contact'
  
  devise_for :users
  
  resources :employees
  get '/new', to: 'employees#new'
 # get 'employees/index'
 # get 'employees/show'
 # get 'employees/edit'
 
 get '/search' => 'employees#search' # , :as => 'search_page'
 
 get '/emphome' => 'employees#home' # , :as => 'search_page'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :searches
end
