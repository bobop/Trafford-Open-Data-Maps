class EverythingsController < ApplicationController
  # GET /allotments
  # GET /allotments.xml
  def index
    #@allotments = Allotment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @allotments }
    end
  end
  
end
