class Admin::GeolocationsController < Admin::BaseController

  crudify :geolocation, :title_attribute => :name

end
