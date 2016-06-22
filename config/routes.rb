Rails.application.routes.draw do
  resources :categoria_posts
  resources :add_categorias_e_post
  resources :categoria
  resources :comentario_autenticados
  resources :comentarios
  resources :posts
  resources :usuarios

  resources :posts do
    resources :comentarios
    resources :categoria_posts
  end

  resources :categoria_posts do
    resources :categoria
    resources :post do
      resources :categoria
    end
  end

  resources :comentarios do
    resources :comentario_autenticados
  end

  post "permissao_admin" => "usuarios#permissao_admin"
  post "revogar_admin" => "usuarios#revogar_admin"

  get "email_twitter" => "session#email_twitter"
  post "email_twitter" => "session#email_twitter"

  get 'session/new'
  get    'login'   => 'session#new'
  post   'login'   => 'session#create'
  delete 'logout'  => 'session#destroy'

  #Redes Sociais
  get "/auth/:provider/callback" => "session#create_rede_social", as: :auth_callback
  get "/auth/failure" => "session#failure", as: :auth_failure
  get "/logout" => "session#destroy", as: :logout_rede_social

  root 'session#new'
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
