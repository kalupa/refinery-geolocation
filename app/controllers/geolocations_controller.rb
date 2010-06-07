class GeolocationsController < ApplicationController

  before_filter :find_all_geolocations
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @geolocation in the line below:
    # present(@page)

		if (params[:unit] == 'kilometers')
			unit_type = 6371
		elsif ((params[:unit] == 'miles'))
			unit_type = 3959
		end
		# this sql ugliness brought to by the differences between MySQL and Postgres
		@geolocations = Geolocation.find_by_sql [
			'SELECT * FROM
				(SELECT id, name, address, lat, lng, (
					 ?
				   * acos( cos( radians(?) ) 
				    * cos( radians( lat ) ) 
				    * cos( radians( lng ) - radians(?) ) 
				    + sin( radians(?) ) 
				    * sin( radians( lat ) ) 
					 )
					) AS distance
				  FROM geolocations
				) as dist_calc
				HAVING distance < ? 
				ORDER BY distance 
				LIMIT ?', 
		
			unit_type,
			params[:lat].to_f, params[:lng].to_f, params[:lat].to_f,
		
			params[:dst].to_i, params[:lim].to_i 
		] 
		# present(@page)
		# render_or_404(@geolocations)
		respond_to do |format|
	    format.html # search.html.erb
	    format.xml  { render :xml => @geolocations }
	    format.json { render :json => @geolocations }
	  end

  end

  def show
    @geolocation = Geolocation.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @geolocation in the line below:
    present(@page)
  end

	
protected

  def find_all_geolocations
    @geolocations = Geolocation.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/geolocations")
  end

end
