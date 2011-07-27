FbGraphSample::Application.routes.draw do
  get "flicker_fun/index"

  get "friend/index"

  #get "album/index"

  #resource :facebook, :except => :create do
  #  get :callback, :to => :create
  #end
 
  resource :facebook
 
  resource :dashboard, :only => :show
  #resource :album, :only =>[:index]
  #resource :canvas, :only => [:show, :create]
  resource :profile, :only => :show
  resource :timeline, :only => [:show, :create]
  #resource :subscription, :only => [:show, :create]
  

  #resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end
  
  resources :album do 
    member do
#      get 'index'
      get 'show_album' 
    end
    collection do
      get 'index'
      get 'show_album' 
    end
  end
  
  resources :friend do
   collection do
     get 'destroy_session'
     get 'index'
     get 'page'
   end
   member do
    get 'view_page_album'
    get 'view_album_photos'
   end   
  end

 resources :flicker_fun do
  collection do
    get 'index'
  end
 end



  root :to => 'top#index'
end
