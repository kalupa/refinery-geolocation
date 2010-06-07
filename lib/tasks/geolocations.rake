namespace :refinery do
  namespace :geolocations do
	  desc "Install geolocation plugin"
 
  	task :install do
  		puts `ruby #{File.expand_path(File.dirname(__FILE__) << '/../..')}/bin/refinerycms-geolocation-install #{Rails.root.to_s}`
  	end
	end
end