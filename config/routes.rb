Water::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  resources :ovodes, :path => 'o-vode'

  resources :request_calls

  resources :quick_orders do
    collection do
      get 'thanks'
    end
  end

  resources :regions

  resources :costs

  resources :accessories, :path => "/cat/accessories"

  resources :coolers, :path => "/cat/coolers"

  resources :waterbottles

  resources :specoffers

  resources :newspages

  resources :infopages, :path => '' do
    collection do
      get 'list'
      get 'sitemap'
    end
  end

  resources :categories do
    collection do
      get 'mail'
    end
  end  

  devise_for :users do
    get '/users/logout' => 'devise/sessions#destroy', :as => "logout"
  end
  # 301 редирект
  match "/old-path", :to => redirect("/new-path")
  match "/cat/coolers/item/1-%D0%BA%D1%83%D0%BB%D0%B5%D1%80-ecotronic-h1-le", :to => redirect("/cat/coolers/1")


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
  root :to => 'infopages#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
