Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#convention'
  get '/editor' => 'pages#editor'
  get '/convention' => 'pages#convention'
  get '/ruby' => 'pages#ruby'
  get '/console' => 'pages#console'
  get '/numbers' => 'pages#numbers'
  get '/strings' => 'pages#strings'
  get '/arrays' => 'pages#arrays'
  get '/hashes' => 'pages#hashes'
  get '/rails_app' => 'pages#rails_app'
  get '/rails_commands' => 'pages#rails_commands'
  get '/embedded_ruby' => 'pages#embedded_ruby'
  get '/help' => 'pages#help'
  get '/quick_search' => 'pages#quick_search'
  get '/log_book' => 'pages#log_book'
  post '/log_book' => 'pages#log_book_post'

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
