class PollingStationsController < ApplicationController
  # GET /polling_stations
  # GET /polling_stations.xml
  def index
    @polling_stations = PollingStation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @polling_stations }
    end
  end
  
protected

  # GET /polling_stations/1
  # GET /polling_stations/1.xml
  def show
    @polling_station = PollingStation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @polling_station }
    end
  end

  # GET /polling_stations/new
  # GET /polling_stations/new.xml
  def new
    @polling_station = PollingStation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @polling_station }
    end
  end

  # GET /polling_stations/1/edit
  def edit
    @polling_station = PollingStation.find(params[:id])
  end

  # POST /polling_stations
  # POST /polling_stations.xml
  def create
    @polling_station = PollingStation.new(params[:polling_station])

    respond_to do |format|
      if @polling_station.save
        flash[:notice] = 'PollingStation was successfully created.'
        format.html { redirect_to(@polling_station) }
        format.xml  { render :xml => @polling_station, :status => :created, :location => @polling_station }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @polling_station.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /polling_stations/1
  # PUT /polling_stations/1.xml
  def update
    @polling_station = PollingStation.find(params[:id])

    respond_to do |format|
      if @polling_station.update_attributes(params[:polling_station])
        flash[:notice] = 'PollingStation was successfully updated.'
        format.html { redirect_to(@polling_station) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @polling_station.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /polling_stations/1
  # DELETE /polling_stations/1.xml
  def destroy
    @polling_station = PollingStation.find(params[:id])
    @polling_station.destroy

    respond_to do |format|
      format.html { redirect_to(polling_stations_url) }
      format.xml  { head :ok }
    end
  end
  
  def import_data
    polling_station_xml = File.read('public/pollingstations.xml')
    polling_station_hash = Hash.from_xml(polling_station_xml)
    #logger.info("--- polling_station_hash: #{polling_station_hash}")
    polling_station_hash['polling_stations']['polling_station'].each do |tree|
      @polling_station = PollingStation.new()
      @polling_station.ref = tree['ref']
      @polling_station.prefix = tree['prefix']
      @polling_station.ward_code = tree['ward_code']
      @polling_station.polling_district_code = tree['polling_district_code']
      @polling_station.ward_name = tree['ward_name']
      @polling_station.access = tree['access']
      @polling_station.availability = tree['availability']
      @polling_station.name = tree['name']
      @polling_station.longitude = tree['longitude']
      @polling_station.latitude = tree['latitude']
      @polling_station.save!
    end
    redirect_to(polling_stations_url)
  end
end
