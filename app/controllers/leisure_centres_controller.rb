class LeisureCentresController < ApplicationController
  # GET /leisure_centres
  # GET /leisure_centres.xml
  def index
    @leisure_centres = LeisureCentre.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @leisure_centres }
    end
  end

  # GET /leisure_centres/1
  # GET /leisure_centres/1.xml
  def show
    @leisure_centre = LeisureCentre.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @leisure_centre }
    end
  end

  # GET /leisure_centres/new
  # GET /leisure_centres/new.xml
  def new
    @leisure_centre = LeisureCentre.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @leisure_centre }
    end
  end

  # GET /leisure_centres/1/edit
  def edit
    @leisure_centre = LeisureCentre.find(params[:id])
  end

  # POST /leisure_centres
  # POST /leisure_centres.xml
  def create
    @leisure_centre = LeisureCentre.new(params[:leisure_centre])

    respond_to do |format|
      if @leisure_centre.save
        flash[:notice] = 'LeisureCentre was successfully created.'
        format.html { redirect_to(@leisure_centre) }
        format.xml  { render :xml => @leisure_centre, :status => :created, :location => @leisure_centre }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @leisure_centre.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /leisure_centres/1
  # PUT /leisure_centres/1.xml
  def update
    @leisure_centre = LeisureCentre.find(params[:id])

    respond_to do |format|
      if @leisure_centre.update_attributes(params[:leisure_centre])
        flash[:notice] = 'LeisureCentre was successfully updated.'
        format.html { redirect_to(@leisure_centre) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @leisure_centre.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /leisure_centres/1
  # DELETE /leisure_centres/1.xml
  def destroy
    @leisure_centre = LeisureCentre.find(params[:id])
    @leisure_centre.destroy

    respond_to do |format|
      format.html { redirect_to(leisure_centres_url) }
      format.xml  { head :ok }
    end
  end
  
  def import_data
    leisure_centre_xml = File.read('public/leisurecentres.xml')
    leisure_centre_hash = Hash.from_xml(leisure_centre_xml)
    logger.info("--- leisure_centre_hash: #{leisure_centre_hash['leisure_centres']['leisure_centre']}")
    leisure_centre_hash['leisure_centres']['leisure_centre'].each do |tree|
      @leisure_centre = LeisureCentre.new()
      @leisure_centre.name = tree['name']
      @leisure_centre.longitude = tree['longitude']
      @leisure_centre.latitude = tree['latitude']
      @leisure_centre.save!
    end
    redirect_to(leisure_centres_url)
  end
  
end
