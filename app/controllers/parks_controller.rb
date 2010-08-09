class ParksController < ApplicationController
  # GET /parks
  # GET /parks.xml
  def index
    @parks = Park.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @parks }
    end
  end
  
protected

  # GET /parks/1
  # GET /parks/1.xml
  def show
    @park = Park.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @park }
    end
  end

  # GET /parks/new
  # GET /parks/new.xml
  def new
    @park = Park.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @park }
    end
  end

  # GET /parks/1/edit
  def edit
    @park = Park.find(params[:id])
  end

  # POST /parks
  # POST /parks.xml
  def create
    @park = Park.new(params[:park])

    respond_to do |format|
      if @park.save
        flash[:notice] = 'Park was successfully created.'
        format.html { redirect_to(@park) }
        format.xml  { render :xml => @park, :status => :created, :location => @park }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @park.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /parks/1
  # PUT /parks/1.xml
  def update
    @park = Park.find(params[:id])

    respond_to do |format|
      if @park.update_attributes(params[:park])
        flash[:notice] = 'Park was successfully updated.'
        format.html { redirect_to(@park) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @park.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /parks/1
  # DELETE /parks/1.xml
  def destroy
    @park = Park.find(params[:id])
    @park.destroy

    respond_to do |format|
      format.html { redirect_to(parks_url) }
      format.xml  { head :ok }
    end
  end
  
  def import_data
    park_xml = File.read('public/parks.xml')
    park_hash = Hash.from_xml(park_xml)
    logger.info("--- park_hash: #{park_hash['parks']['park']}")
    park_hash['parks']['park'].each do |tree|
      @park = Park.new()
      @park.name = tree['name']
      @park.location = tree['location']
      @park.park_id = tree['id']
      @park.ref = tree['ref']
      @park.area_hectares = tree['area']
      @park.park_type = tree['type']
      @park.longitude = tree['longitude']
      @park.latitude = tree['latitude']
      @park.save!
    end
    redirect_to(parks_url)
  end
    
end
