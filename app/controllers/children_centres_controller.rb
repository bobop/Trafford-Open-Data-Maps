class ChildrenCentresController < ApplicationController
  # GET /children_centres
  # GET /children_centres.xml
  def index
    @children_centres = ChildrenCentre.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @children_centres }
    end
  end
  
protected

  # GET /children_centres/1
  # GET /children_centres/1.xml
  def show
    @children_centre = ChildrenCentre.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @children_centre }
    end
  end

  # GET /children_centres/new
  # GET /children_centres/new.xml
  def new
    @children_centre = ChildrenCentre.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @children_centre }
    end
  end

  # GET /children_centres/1/edit
  def edit
    @children_centre = ChildrenCentre.find(params[:id])
  end

  # POST /children_centres
  # POST /children_centres.xml
  def create
    @children_centre = ChildrenCentre.new(params[:children_centre])

    respond_to do |format|
      if @children_centre.save
        flash[:notice] = 'ChildrenCentre was successfully created.'
        format.html { redirect_to(@children_centre) }
        format.xml  { render :xml => @children_centre, :status => :created, :location => @children_centre }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @children_centre.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /children_centres/1
  # PUT /children_centres/1.xml
  def update
    @children_centre = ChildrenCentre.find(params[:id])

    respond_to do |format|
      if @children_centre.update_attributes(params[:children_centre])
        flash[:notice] = 'ChildrenCentre was successfully updated.'
        format.html { redirect_to(@children_centre) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @children_centre.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /children_centres/1
  # DELETE /children_centres/1.xml
  def destroy
    @children_centre = ChildrenCentre.find(params[:id])
    @children_centre.destroy

    respond_to do |format|
      format.html { redirect_to(children_centres_url) }
      format.xml  { head :ok }
    end
  end
  
  def import_data
    children_centre_xml = File.read('public/childrenscentres.xml')
    children_centre_hash = Hash.from_xml(children_centre_xml)
    #logger.info("--- children_centre_hash: #{children_centre_hash}")
    children_centre_hash['childrens_centres']['childrens_centre'].each do |tree|
      @children_centre = ChildrenCentre.new()
      @children_centre.centre_id = tree['id']
      @children_centre.name = tree['name']
      @children_centre.centre_type = tree['type']
      @children_centre.location = tree['location']
      @children_centre.address = tree['address']
      @children_centre.town = tree['town']
      @children_centre.postcode = tree['postcode']
      @children_centre.telephone = tree['telephone']
      @children_centre.notes = tree['notes']
      @children_centre.longitude = tree['longitude']
      @children_centre.latitude = tree['latitude']
      @children_centre.save!
    end
    redirect_to(children_centres_url)
  end
end
