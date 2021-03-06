Rails.application.routes.draw do
  resources :inventarios
  resources :inventories
  resources :productos
  resources :tipo_productos
  resources :reservas
  resources :eventos
  resources :salas
  resources :administrator_locals
  resources :locals


  
  get 'pages/index'

  get 'pages/about_us'

  get 'pages/faq'

  get 'pages/tos'

  get 'pages/contact_us'
  
  get 'pages/canciones'
  
  
  #Lista de canciones!
  get 'canciones/thriller'
  get 'canciones/chandelier'
  get 'canciones/flashlight'
  get 'canciones/blankspace'
  get 'canciones/tryeverything'
  get 'canciones/ignorance'
  get 'canciones/thefeeling'
  get 'canciones/bealright'
  get 'canciones/team'
  get 'canciones/superbass'
  get 'canciones/one'
  get 'canciones/sunshine'
  get 'canciones/your'
  get 'canciones/miss'
  get 'canciones/loved'
  get 'canciones/everything'
  get 'canciones/everybody'
  get 'canciones/bling'
  get 'canciones/bring'
  get 'canciones/down'
  
  #MANTENIMIENTOS
  get 'productos/new'
  get 'tipo_productos/new'
  get 'salas/new'
  get 'eventos/new'
  get 'locals/new'
  
  
  get 'tipo_productos/new'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  resources :employees
  
  devise_for :users , :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :omniauth_authorize => 'users/omniauth_authorize' }
  
  get 'home/index'
  root 'home#index'
  begin 
    get "/intranet/intranet", to: 'intranet#intranet', as: 'intranet' 
    get "/intranet/login", to: 'intranet#login', as: 'login' 
    post "/intranet/intento_sesion", to: 'intranet#intento_sesion', as: 'intento_sesion'
    delete "/intranet/cerrar_sesion", to: 'intranet#cerrar_sesion', as: 'cerrar_sesion'
    
  end
  
  begin 
    get "/reserva_cliente/reservacli", to: 'reserva_cliente#reservacli', as: 'reservacli'
    get "/reserva_cliente/new", to: 'reserva_cliente#new', as: 'reservaclinew'
    post "/reserva_cliente/create", to: 'reserva_cliente#create', as: 'reservaclicreate' 
    get "/reserva_cliente/edit/:id", to: 'reserva_cliente#edit', as: 'reservacliedit'
    put "/reserva_cliente/update/:id", to: 'reserva_cliente#update', as: 'reservacliupdate'
    delete  "/reserva_cliente/destroy/:id", to: 'reserva_cliente#destroy', as: 'reservaclidelete'
  end


  
  #get '/intranet', to: 'intranet#login', as: 'login'
  
  
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
  match "/404" => "errors#error404", via: [ :get, :post, :patch, :delete ]
end
