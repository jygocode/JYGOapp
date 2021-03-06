Rails.application.routes.draw do


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :products do
    collection { post :import }
  end

  resources :shops
  resources :orders do
    resources :reviews, only: [:new, :create, :show]
  end

  devise_for :users, :controllers => {sessions: 'sessions', registrations: 'registrations'}


  scope '(:locale)', locale: /fr|en/ do
    resources :users
    resources :shoppers, only: [:show, :index, :new, :create, :show_all]
    resources :searchs, only: [:index]
    resources :availabilities
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  get '/not_available' => "welcome#not_available" ,as: 'not_available'
  get '/sorry' => "welcome#sorry", as: 'sorry'
  get '/available'=> "welcome#available", as: 'available'
  get '/team' => "welcome#team", as: 'team'
  get '/contactus' => "welcome#contactus", as: 'nouscontacter'
  get '/edit_info' => "users#edit_info", as: 'edit_info'
  get '/shop_config_1' => "high_voltage/pages#show", id: 'orders_user'
  get '/home_call_action' => "users#home_call_action", as: 'home'
  get '/show_all' => "orders#show_all", as: 'mes_commandes'
  get '/mes_livraisons' => "orders#mes_livraisons"
  get '/not_shopper' => "orders#not_shopper"

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
