CCBCWebsite::Application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "ccbc_core#Home"
  
  get "/about" => "ccbc_core#About"
  get "/join" => "ccbc_core#Join"
  get "/equip" => "ccbc_core#Equip"
  get "/programme" => "ccbc_core#Programme"
  get "/newsletters" => "ccbc_core#Newsletters"
  get "/club" => "ccbc_core#Club"
  get "/map" => "ccbc_core#Map"
  get "/links" => "ccbc_core#Links"
  
  get "/booking" => "booking#index"
  get "/booking/:id" => "booking#show"
  get "/booking/:id/book1" => "booking#book1"
  get "/booking/:id/book2" => "booking#book2"
  get "/booking/:id/book3" => "booking#book3"
  get "/source" => "booking#source"
  get "/update" => "booking#update"
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
