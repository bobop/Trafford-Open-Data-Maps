class AllotmentsController < ApplicationController
  # GET /allotments
  # GET /allotments.xml
  def index
    @allotments = Allotment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @allotments }
    end
  end
  
protected

  # GET /allotments/1
  # GET /allotments/1.xml
  def show
    @allotment = Allotment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @allotment }
    end
  end

  # GET /allotments/new
  # GET /allotments/new.xml
  def new
    @allotment = Allotment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @allotment }
    end
  end

  # GET /allotments/1/edit
  def edit
    @allotment = Allotment.find(params[:id])
  end

  # POST /allotments
  # POST /allotments.xml
  def create
    @allotment = Allotment.new(params[:allotment])

    respond_to do |format|
      if @allotment.save
        flash[:notice] = 'Allotment was successfully created.'
        format.html { redirect_to(@allotment) }
        format.xml  { render :xml => @allotment, :status => :created, :location => @allotment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @allotment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /allotments/1
  # PUT /allotments/1.xml
  def update
    @allotment = Allotment.find(params[:id])

    respond_to do |format|
      if @allotment.update_attributes(params[:allotment])
        flash[:notice] = 'Allotment was successfully updated.'
        format.html { redirect_to(@allotment) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @allotment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /allotments/1
  # DELETE /allotments/1.xml
  def destroy
    @allotment = Allotment.find(params[:id])
    @allotment.destroy

    respond_to do |format|
      format.html { redirect_to(allotments_url) }
      format.xml  { head :ok }
    end
  end
  
  def import_data
    allotment_xml = File.read('public/allotments.xml')
    allotment_hash = Hash.from_xml(allotment_xml)
    logger.info("--- allotment_hash: #{allotment_hash['allotments']['allotment']}")
    allotment_hash['allotments']['allotment'].each do |tree|
      @allotment = Allotment.new()
      @allotment.allotment_id = tree['id']
      @allotment.ref = tree['ref']
      @allotment.name = tree['name']
      @allotment.area = tree['area']
      @allotment.longitude = tree['longitude']
      @allotment.latitude = tree['latitude']
      @allotment.save!
    end
    redirect_to(allotments_url)
  end
  
end
