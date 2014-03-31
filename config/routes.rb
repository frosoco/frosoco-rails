Campfirehq::Application.routes.draw do

  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get 'user/feed' => 'user#feed'

  get 'user/login' => 'user#login'
  post 'user/login' => 'user#login'

  get 'user/logout' => 'user#logout'

  get 'user/register' => 'user#register'
  post 'user/register' => 'user#register'

  get 'user/profile' => 'user#profile'
  post 'user/profile' => 'user#profile'

  get 'user/show/:id' => 'user#show'

  get 'post/:id' => 'post#index'

  post 'post/create' => 'post#create'


  get 'group/create' => 'group#create'
  post 'group/create' => 'group#create'

  get 'group/:id' => 'group#index'

  get 'group/:id/feed' => 'group#feed'

  get 'group/:id/modify' => 'group#modify'
  post 'group/:id/modify' => 'group#modify'

  get 'group/:id/add' => 'group#add'
  post 'group/:id/add' => 'group#add'




  # You can have the root of your site routed with "root"
  root 'user#feed'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
