ActionController::Routing::Routes.draw do |map|
  

  
  map.import_trees 'trees/import_data', :controller => 'trees', :action => 'import_data'
  map.import_allotments 'allotments/import_data', :controller => 'allotments', :action => 'import_data'
  map.import_leisure_centres 'leisure_centres/import_data', :controller => 'leisure_centres', :action => 'import_data'
  map.import_libraries 'libraries/import_data', :controller => 'libraries', :action => 'import_data'
  map.import_parks 'parks/import_data', :controller => 'parks', :action => 'import_data'
  map.import_recycling_sites 'recycling_sites/import_data', :controller => 'recycling_sites', :action => 'import_data'
  map.import_schools 'schools/import_data', :controller => 'schools', :action => 'import_data'
  map.import_children_centres 'children_centres/import_data', :controller => 'children_centres', :action => 'import_data'
  map.import_polling_stations 'polling_stations/import_data', :controller => 'polling_stations', :action => 'import_data'
  map.import_train_stations 'train_stations/import_data', :controller => 'train_stations', :action => 'import_data'
  map.import_bus_stops 'bus_stops/import_data', :controller => 'bus_stops', :action => 'import_data'
    
  map.resources :bus_stops
  
  map.resources :train_stations
  
  map.resources :polling_stations
  
  map.resources :children_centres
  
  map.resources :everythings
  
  map.resources :schools

  map.resources :recycling_sites

  map.resources :parks

  map.resources :libraries

  map.resources :leisure_centres

  map.resources :allotments

  map.resources :trees

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "everythings", :action => "home"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
