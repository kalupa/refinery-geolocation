class GeolocationGenerator < Rails::Generator::NamedBase

  def initialize(*runtime_args)
    # set first argument to the table's name so that the user doesn't have to pass it in.
    runtime_args[0] = ["news_items"]
    super(*runtime_args)
  end

  def banner
    "Usage: script/generate geolocation"
  end

  def manifest
    record do |m|
      m.migration_template 'migration.rb', 'db/migrate',
        :migration_file_name => "create_structure_for_geolocation",
        :assigns => {
          :migration_name => "CreateStructureForGeolocation",
          :table_name => "geolocations",
          :attributes => [
            Rails::Generator::GeneratedAttribute.new("name", "string"),
            Rails::Generator::GeneratedAttribute.new("address", "string"),
            Rails::Generator::GeneratedAttribute.new("lat", "float"),
            Rails::Generator::GeneratedAttribute.new("lng", "float"),
            Rails::Generator::GeneratedAttribute.new("position", "integer")
          ]
        }
    end
  end

end if defined?(Rails::Generator::NamedBase)