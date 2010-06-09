class GeolocationsController < ApplicationController

  # before_filter :find_all_geolocations
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @geolocation in the line below:
    # present(@page)
		@geolocations = Geolocation.find_by_distance_from ( params[:lat], params[:lng], params[:dst], params[:unit], params[:lim] )

		respond_to do |format|
	    format.html # search.html.erb
	    format.xml  { render :xml => @geolocations }
	    format.json { render :json => @geolocations }
	  end

  end

protected

  # def find_all_geolocations
  #   @geolocations = Geolocation.find(:all, :order => "position ASC")
  # end

  def find_page
    @page = Page.find_by_link_url("/geolocations")
  end

end
