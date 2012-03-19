KwTopbeauty::Application.routes.draw do
  resources :noticias
  resources :produtos do
  	collection do
		get 'colors'	
		post 'rating'
		get 'rating'
	end
  end
  resources :t_conosco
  resources :contato
  resources :home
  resources :user_sessions
  resources :users
  resources :password_resets
  resources :atualizar
  resources :onde_encontrar do
    collection do
      post 'resultados'
      get 'popula_cidades'
    end
  end
  #Inicio do namespace Admin
  namespace(:admin){
    resources :lines do
	    resources :categories do
        resources :products do
          resources :colors
        end
      end
    end
    resources :resellers 
    resources :banners
    resources :posts 
    resources :static_contents
    resources :users do
      collection do
        get 'search'
      end
    end
    
    root :to => "static_contents#index"
  }
  #Final do namespace Admin
  
  #Inicio do namespace assistente
  namespace(:assistente){
    resources :home
    resources :estilo do
      get 'pergunta1'
      get 'pergunta2'
      get 'pergunta3'
      get 'pergunta4'
      get 'pergunta5'
      
      post 'pergunta1'
      post 'pergunta2'
      post 'pergunta3'
      post 'pergunta4'
      post 'pergunta5'
      
      post 'resposta'
      get 'resposta'
    end
    resources :compromisso
    root :to => "home#index"
  }
  
  root :to => "home#index"
  match 'cadastro' => "users#new"
  match 'login' => 'user_sessions#new'  
  match 'logout' => 'user_sessions#destroy' 
  match 'empresa' => "static_contents#empresa" 
  match 'politica_de_privacidade' => "static_contents#politica_de_privacidade" 
  match 'termos_de_uso' => "static_contents#termos_de_uso" 

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
