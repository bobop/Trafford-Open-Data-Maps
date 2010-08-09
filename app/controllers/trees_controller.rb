class TreesController < ApplicationController
  # GET /trees
  # GET /trees.xml
  def index
    respond_to do |format|
      format.html do
        @trees = Tree.all(:limit => '100', :order => RANDOM_TEXT)
      end
      format.xml  { render :xml => @trees }
      format.js do
        ne = params[:ne].split(',')
        sw = params[:sw].split(',')
        top_lat = ne[0]
        bottom_lat = sw[0]
        left_lng = sw[1]
        right_lng = ne[1]
        
        @trees = Tree.find(:all, :conditions => ["(latitude < ? AND latitude > ?) OR (longitude > ? AND longitude < ?)",top_lat,bottom_lat,left_lng,right_lng], :limit => 500, :order => RANDOM_TEXT)
        render :json => @trees.to_json
      end
    end
  end
  
protected

  # GET /trees/1
  # GET /trees/1.xml
  def show
    @tree = Tree.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tree }
    end
  end

  # GET /trees/new
  # GET /trees/new.xml
  def new
    @tree = Tree.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tree }
    end
  end

  # GET /trees/1/edit
  def edit
    @tree = Tree.find(params[:id])
  end

  # POST /trees
  # POST /trees.xml
  def create
    @tree = Tree.new(params[:tree])

    respond_to do |format|
      if @tree.save
        flash[:notice] = 'Tree was successfully created.'
        format.html { redirect_to(@tree) }
        format.xml  { render :xml => @tree, :status => :created, :location => @tree }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tree.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /trees/1
  # PUT /trees/1.xml
  def update
    @tree = Tree.find(params[:id])

    respond_to do |format|
      if @tree.update_attributes(params[:tree])
        flash[:notice] = 'Tree was successfully updated.'
        format.html { redirect_to(@tree) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tree.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /trees/1
  # DELETE /trees/1.xml
  def destroy
    @tree = Tree.find(params[:id])
    @tree.destroy

    respond_to do |format|
      format.html { redirect_to(trees_url) }
      format.xml  { head :ok }
    end
  end
  
  def import_data
    trees_xml = File.read('public/trees.xml')
    trees_hash = Hash.from_xml(trees_xml)
    logger.info("--- trees_hash: #{trees_hash['trees']['tree'].last}")
    trees_hash['trees']['tree'].each do |tree|
      @traffordtree = Tree.new()
      @traffordtree.tree_ref = tree['TreeRef']
      @traffordtree.species = tree['Species']
      @traffordtree.locality_name = tree['LocalityName']
      @traffordtree.district_name = tree['DistrictName']
      @traffordtree.height = tree['Height']
      @traffordtree.dbh = tree['DBH']
      @traffordtree.longitude = tree['Longitude']
      @traffordtree.latitude = tree['Latitude']
      @traffordtree.save!
    end
    redirect_to(trees_url)
  end
  
end
