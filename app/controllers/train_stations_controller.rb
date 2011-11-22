class TrainStationsController < ApplicationController
  # GET /train_stations
  # GET /train_stations.xml
  def index
    @train_stations = TrainStation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @train_stations }
    end
  end
  
protected

  # GET /train_stations/1
  # GET /train_stations/1.xml
  def show
    @train_station = TrainStation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @train_station }
    end
  end

  # GET /train_stations/new
  # GET /train_stations/new.xml
  def new
    @train_station = TrainStation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @train_station }
    end
  end

  # GET /train_stations/1/edit
  def edit
    @train_station = TrainStation.find(params[:id])
  end

  # POST /train_stations
  # POST /train_stations.xml
  def create
    @train_station = TrainStation.new(params[:train_station])

    respond_to do |format|
      if @train_station.save
        flash[:notice] = 'TrainStation was successfully created.'
        format.html { redirect_to(@train_station) }
        format.xml  { render :xml => @train_station, :status => :created, :location => @train_station }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @train_station.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /train_stations/1
  # PUT /train_stations/1.xml
  def update
    @train_station = TrainStation.find(params[:id])

    respond_to do |format|
      if @train_station.update_attributes(params[:train_station])
        flash[:notice] = 'TrainStation was successfully updated.'
        format.html { redirect_to(@train_station) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @train_station.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /train_stations/1
  # DELETE /train_stations/1.xml
  def destroy
    @train_station = TrainStation.find(params[:id])
    @train_station.destroy

    respond_to do |format|
      format.html { redirect_to(train_stations_url) }
      format.xml  { head :ok }
    end
  end
  
  def import_data
    train_station_xml = File.read('public/trainstations.xml')
    train_station_hash = Hash.from_xml(train_station_xml)
    #logger.info("--- train_station_hash: #{train_station_hash}")
    train_station_hash['train_stations']['train_station'].each do |tree|
      @train_station = TrainStation.new()
      @train_station.crs_code = tree['crs_code']
      @train_station.name = tree['station_name']
      @train_station.longitude = tree['longitude']
      @train_station.latitude = tree['latitude']
      @train_station.save!
    end
    redirect_to(train_stations_url)
  end
end
