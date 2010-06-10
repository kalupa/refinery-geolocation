class Geolocation < ActiveRecord::Base

	acts_as_mappable
	
  # acts_as_indexed :fields => [:name, :address, :lat, :lng],
  #                 :index_file => [Rails.root.to_s, "tmp", "index"]

  validates_presence_of :name
  validates_uniqueness_of :name

	# def self.find_by_distance_from (lat, lng, dst = 10, dst_unit = 'kilometers', lim = 10)
	# 	db_adapter = ActiveRecord::Base.configurations[Rails.env]['adapter']
	# 	lat = lat.to_f; lng = lng.to_f
	# 	dst = dst.to_i; lim = lim.to_i
	# 	if (dst_unit == 'kilometers')
	# 		dst_unit_constant = 6371
	# 	elsif (dst_unit == 'miles')
	# 		dst_unit_constant = 3959
	# 	end
	# 	case db_adapter 
	# 		when 'mysql' then
	# 			find_by_sql [
	# 				'SELECT * FROM
	# 					(SELECT id, name, address, lat, lng, (
	# 						 ?
	# 					   * acos( cos( radians(?) ) 
	# 					    * cos( radians( lat ) ) 
	# 					    * cos( radians( lng ) - radians(?) ) 
	# 					    + sin( radians(?) ) 
	# 					    * sin( radians( lat ) ) 
	# 						 )
	# 						) AS distance
	# 					  FROM geolocations
	# 					) as dist_calc
	# 					HAVING distance < ? 
	# 					ORDER BY distance 
	# 					LIMIT ?',
	# 					dst_unit_constant,
	# 					lat, lng, lat,
	# 					dst, lim 
	# 			]
	# 		else
	# 			raise 'adapter error'
	# 	end
	# 	
	# end

end
