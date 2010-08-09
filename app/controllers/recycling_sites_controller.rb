class RecyclingSitesController < ApplicationController
  # GET /recycling_sites
  # GET /recycling_sites.xml
  def index
    @recycling_sites = RecyclingSite.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recycling_sites }
    end
  end
  
protected

  # GET /recycling_sites/1
  # GET /recycling_sites/1.xml
  def show
    @recycling_site = RecyclingSite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recycling_site }
    end
  end

  # GET /recycling_sites/new
  # GET /recycling_sites/new.xml
  def new
    @recycling_site = RecyclingSite.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @recycling_site }
    end
  end

  # GET /recycling_sites/1/edit
  def edit
    @recycling_site = RecyclingSite.find(params[:id])
  end

  # POST /recycling_sites
  # POST /recycling_sites.xml
  def create
    @recycling_site = RecyclingSite.new(params[:recycling_site])

    respond_to do |format|
      if @recycling_site.save
        flash[:notice] = 'RecyclingSite was successfully created.'
        format.html { redirect_to(@recycling_site) }
        format.xml  { render :xml => @recycling_site, :status => :created, :location => @recycling_site }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @recycling_site.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /recycling_sites/1
  # PUT /recycling_sites/1.xml
  def update
    @recycling_site = RecyclingSite.find(params[:id])

    respond_to do |format|
      if @recycling_site.update_attributes(params[:recycling_site])
        flash[:notice] = 'RecyclingSite was successfully updated.'
        format.html { redirect_to(@recycling_site) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recycling_site.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /recycling_sites/1
  # DELETE /recycling_sites/1.xml
  def destroy
    @recycling_site = RecyclingSite.find(params[:id])
    @recycling_site.destroy

    respond_to do |format|
      format.html { redirect_to(recycling_sites_url) }
      format.xml  { head :ok }
    end
  end
  
  def import_data
    recycling_site_xml = File.read('public/recyclingcentres.xml')
    recycling_site_hash = Hash.from_xml(recycling_site_xml)
    logger.info("--- recycling_site_hash: #{recycling_site_hash['recycling_sites']['recycling_site']}")
    recycling_site_hash['recycling_sites']['recycling_site'].each do |tree|
      @recycling_site = RecyclingSite.new()
      @recycling_site.site_id = tree['id']
      @recycling_site.location = tree['location']
      @recycling_site.street = tree['street']
      @recycling_site.town = tree['town']
      @recycling_site.longitude = tree['longitude']
      @recycling_site.latitude = tree['latitude']
      @recycling_site.facilities = tree['facilities']
      @recycling_site.save!
    end
    redirect_to(recycling_sites_url)
  end
  
end
