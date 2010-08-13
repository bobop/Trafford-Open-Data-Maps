class EverythingsController < ApplicationController
  # GET /allotments
  # GET /allotments.xml
  def index
    @allotments = Allotment.all
    @children_centres = ChildrenCentre.all
    @leisure_centres = LeisureCentre.all
    @libraries = Library.all
    @parks = Park.all
    @polling_stations = PollingStation.all
    @recycling_sites = RecyclingSite.all
    @schools = School.all
    @train_stations = TrainStation.all
    @trees = Tree.all(:limit => '100', :order => RANDOM_TEXT)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @allotments }
    end
  end
  
end
