class Geolocation < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :address, :lat, :lng],
                  :index_file => [Rails.root.to_s, "tmp", "index"]

  validates_presence_of :name
  validates_uniqueness_of :name



end
