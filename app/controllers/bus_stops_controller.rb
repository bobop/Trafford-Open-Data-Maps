class BusStopsController < ApplicationController
  # GET /bus_stops
  # GET /bus_stops.xml
  def index
    respond_to do |format|
      format.html do
        @bus_stops = BusStop.all(:limit => '100', :order => RANDOM_TEXT)
      end
      format.xml  { render :xml => @bus_stops }
      format.js do
        ne = params[:ne].split(',')
        sw = params[:sw].split(',')
        top_lat = ne[0]
        bottom_lat = sw[0]
        left_lng = sw[1]
        right_lng = ne[1]
        
        @bus_stops = BusStop.find(:all, :conditions => ["(latitude < ? AND latitude > ?) OR (longitude > ? AND longitude < ?)",top_lat,bottom_lat,left_lng,right_lng], :limit => 300, :order => RANDOM_TEXT)
        render :json => @bus_stops.to_json
      end
    end
  end
  
protected

  # GET /bus_stops/1
  # GET /bus_stops/1.xml
  def show
    @bus_stop = BusStop.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bus_stop }
    end
  end

  # GET /bus_stops/new
  # GET /bus_stops/new.xml
  def new
    @bus_stop = BusStop.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bus_stop }
    end
  end

  # GET /bus_stops/1/edit
  def edit
    @bus_stop = BusStop.find(params[:id])
  end

  # POST /bus_stops
  # POST /bus_stops.xml
  def create
    @bus_stop = BusStop.new(params[:bus_stop])

    respond_to do |format|
      if @bus_stop.save
        flash[:notice] = 'BusStop was successfully created.'
        format.html { redirect_to(@bus_stop) }
        format.xml  { render :xml => @bus_stop, :status => :created, :location => @bus_stop }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bus_stop.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bus_stops/1
  # PUT /bus_stops/1.xml
  def update
    @bus_stop = BusStop.find(params[:id])

    respond_to do |format|
      if @bus_stop.update_attributes(params[:bus_stop])
        flash[:notice] = 'BusStop was successfully updated.'
        format.html { redirect_to(@bus_stop) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bus_stop.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bus_stops/1
  # DELETE /bus_stops/1.xml
  def destroy
    @bus_stop = BusStop.find(params[:id])
    @bus_stop.destroy

    respond_to do |format|
      format.html { redirect_to(bus_stops_url) }
      format.xml  { head :ok }
    end
  end
  
  def import_data
    bus_stop_xml = File.read('public/busstops.xml')
    bus_stop_hash = Hash.from_xml(bus_stop_xml)
    logger.info("--- bus_stop_hash: #{bus_stop_hash['bus_stops']['bus_stop']}")
    bus_stop_hash['bus_stops']['bus_stop'].each do |tree|
      @bus_stop = BusStop.new()
      @bus_stop.naptan_code = tree['naptan_code']
      @bus_stop.common_name = tree['common_name']
      @bus_stop.locality_name = tree['locality_name']
      @bus_stop.longitude = tree['longitude']
      @bus_stop.latitude = tree['latitude']
      @bus_stop.save!
    end
    redirect_to(bus_stops_url)
  end
end
