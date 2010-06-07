ActionController::Routing::Routes.draw do |map|
  map.resources :geolocations

  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :geolocations, :collection => {:update_positions => :post}
  end
end
