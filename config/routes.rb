Water::Application.routes.draw do

  match "/home", :to => redirect("/")
  match "/cat", :to => redirect("/cat/coolers")
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

  resources :waterbottles , path: "/price"

  resources :specoffers, path: "/skidki"

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
  # match "/zakaz-dostavka-vody", :to => redirect("/transport")
  match "/cat/coolers/item/1-%D0%BA%D1%83%D0%BB%D0%B5%D1%80-ecotronic-h1-le", :to => redirect("/cat/coolers/1")
  match "/cat/coolers/item/8-%D0%BA%D1%83%D0%BB%D0%B5%D1%80-ecotronic-h1-l", :to => redirect("/cat/coolers/2")
  match "/cat/coolers/item/6-%D0%BA%D1%83%D0%BB%D0%B5%D1%80-ael-170-ld", :to => redirect("/cat/coolers/3")
  match "/cat/coolers/item/7-%D0%BA%D1%83%D0%BB%D0%B5%D1%80-ecotronic-h2-l", :to => redirect("/cat/coolers/4")
  match "/cat/coolers/item/9-%D0%BA%D1%83%D0%BB%D0%B5%D1%80-bio-family-wbf-1000", :to => redirect("/cat/coolers/5")
  match "/cat/coolers/item/10-%D0%BA%D1%83%D0%BB%D0%B5%D1%80-ael-ylr-2-5-x-16l/hl", :to => redirect("/cat/coolers/6")
  match "/cat/coolers/item/11-%D0%BA%D1%83%D0%BB%D0%B5%D1%80-ecotronic-h1-l%D1%81", :to => redirect("/cat/coolers/7")
  match "/cat/coolers/item/13-%D0%BA%D1%83%D0%BB%D0%B5%D1%80-ecotronic-g2-lspm", :to => redirect("/cat/coolers/8")
  match "/cat/coolers/item/19-%D0%BA%D1%83%D0%BB%D0%B5%D1%80-ecotronic-h2-lf", :to => redirect("/cat/coolers/9")
  match "/cat/coolers/item/20-%D0%BA%D1%83%D0%BB%D0%B5%D1%80-ecotronic-h1-lf", :to => redirect("/cat/coolers/10")
  match "/cat/coolers/item/21-%D0%BA%D1%83%D0%BB%D0%B5%D1%80-ecotronic-c2-lfpm", :to => redirect("/cat/coolers/11")
  match "/cat/coolers/item/23-%D0%BA%D1%83%D0%BB%D0%B5%D1%80-ael-myl31-s-%D0%B2-black", :to => redirect("/cat/coolers/12")
  match "/cat/coolers/item/24-%D0%BA%D1%83%D0%BB%D0%B5%D1%80-ecotronic-h2-tn", :to => redirect("/cat/coolers/13 ")
  match "/cat/coolers/item/26-%D0%BA%D1%83%D0%BB%D0%B5%D1%80-ecotronic-h2-te", :to => redirect("/cat/coolers/14")
  match "/cat/coolers/item/27-%D0%BA%D1%83%D0%BB%D0%B5%D1%80-ecotronic-h1-te", :to => redirect("/cat/coolers/15")
  match "/cat/coolers/item/28-%D0%BA%D1%83%D0%BB%D0%B5%D1%80-ael-340-td", :to => redirect("/cat/coolers/16")
  match "/cat/coolers/item/29-%D0%BA%D1%83%D0%BB%D0%B5%D1%80-ecotronic-h1-t", :to => redirect("/cat/coolers/17")
  match "/cat/coolers/item/30-%D0%BA%D1%83%D0%BB%D0%B5%D1%80-ecotronic-%D1%812-tpm", :to => redirect("/cat/coolers/18")
  match "/cat/coolers/item/31-%D0%BA%D1%83%D0%BB%D0%B5%D1%80-bio-family-wbf-1000s", :to => redirect("/cat/coolers/19")


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
