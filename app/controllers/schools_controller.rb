class SchoolsController < ApplicationController
  # GET /schools
  # GET /schools.xml
  def index
    @schools = School.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @schools }
    end
  end

  # GET /schools/1
  # GET /schools/1.xml
  def show
    @school = School.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @school }
    end
  end

  # GET /schools/new
  # GET /schools/new.xml
  def new
    @school = School.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @school }
    end
  end

  # GET /schools/1/edit
  def edit
    @school = School.find(params[:id])
  end

  # POST /schools
  # POST /schools.xml
  def create
    @school = School.new(params[:school])

    respond_to do |format|
      if @school.save
        flash[:notice] = 'School was successfully created.'
        format.html { redirect_to(@school) }
        format.xml  { render :xml => @school, :status => :created, :location => @school }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @school.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /schools/1
  # PUT /schools/1.xml
  def update
    @school = School.find(params[:id])

    respond_to do |format|
      if @school.update_attributes(params[:school])
        flash[:notice] = 'School was successfully updated.'
        format.html { redirect_to(@school) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @school.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /schools/1
  # DELETE /schools/1.xml
  def destroy
    @school = School.find(params[:id])
    @school.destroy

    respond_to do |format|
      format.html { redirect_to(schools_url) }
      format.xml  { head :ok }
    end
  end
  
  def import_data
    school_xml = File.read('public/schools.xml')
    school_hash = Hash.from_xml(school_xml)
    logger.info("--- school_hash: #{school_hash['schools']['school']}")
    school_hash['schools']['school'].each do |tree|
      @school = School.new()
      @school.urn = tree['urn']
      @school.lea = tree['lea']
      @school.establishment = tree['establishment']
      @school.name = tree['name']
      @school.school_type = tree['type']
      @school.email = tree['email']
      @school.url = tree['url']
      @school.longitude = tree['longitude']
      @school.latitude = tree['latitude']
      @school.save!
    end
    redirect_to(schools_url)
  end
  
end
