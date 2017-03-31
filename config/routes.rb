Rails.application.routes.draw do

   get 'signUp'  => 'users#new'
   post'signUp'  => 'users#create' 
   post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
   post 'home', to: 'users#home' 
  #resources :users do 
  # resources :posts do
   #resources :comments
 #end
#end

    #resources :likes
    #resources :sessions
    #resources :events 
  #resources :registrations 

      # match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
     #  match 'auth/failure', to: redirect('/'), via: [:get, :post]
     #  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]


    match "comments_like/:comments_id" => "comments#create", :via => 'post'
    match "comments_like/:comment_id" =>  "comments#index", :via => 'get'
    match "posts_like/:post_id" => "likes#create_post", :via => 'post'
    match "posts_like/:post_id" => "likes#index_post", :via => 'get'


  resources :users do
        resources :posts do
        resources :likes
      end
    end
    resources :users do
        resources :posts do
        resources :comments
      end
    end
    
  resources :sessions


end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

