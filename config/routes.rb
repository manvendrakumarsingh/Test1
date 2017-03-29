Rails.application.routes.draw do

   get 'signUp'  => 'users#new'
   post'signUp'  => 'users#create' 
   post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users do 
  	resources :events 
  	resources :posts
    resources :likes
    resources :sessions
  #resources :registrations 


end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

