Refinery::Plugin.register do |plugin|
  plugin.title = "Geolocations"
  plugin.description = "Manage Locations"
  plugin.version = 1.0
  plugin.activity = {
    :class => Geolocation,
    :url_prefix => "edit",
    :title => 'name'
  }
  # this tells refinery where this plugin is located on the filesystem and helps with urls.
  # plugin.directory = directory
end
