Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  base_url = 'scrapeserv/'
  post base_url + 'scrapes/request/dl/:id'    => 'scrapes#server_download'
  post base_url + 'users/login'               => 'users#signin'
  post base_url + 'favs/set'                  => 'favs#set'
  post base_url + 'favs/add'                  => 'favs#add'
  post base_url + 'favs/remove'               => 'favs#remove'

  get base_url + 'scrapes/rawtest'            => 'scrapes#raw'
  #get base_url + 'scrapes/test'              => 'scrapes#test'
  get base_url + 'scrapes/get/link/:id'       => 'scrapes#get_link'
  get base_url + 'scrapes/get/subbers'        => 'scrapes#get_subbers'
  get base_url + 'scrapes/get/fav'            => 'scrapes#get_fav'
  get base_url + 'scrapes/get/:subber'        => 'scrapes#get'
  get base_url + 'scrapes/get'                => 'scrapes#get'
  get base_url + 'favs/get'                   => 'favs#get'
  
  match '*path', to: 'scrapes#get', via: :all


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
