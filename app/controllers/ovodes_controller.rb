class OvodesController < ApplicationController
  before_filter :admin_require, :except => [ :show, :index ]
  # GET /ovodes
  # GET /ovodes.json
  def index
    @ovode = Ovode.find_by_tag("main")
    
    @title = @ovode.try(:seotitle)
    @seodesc = @ovode.try(:seodesc)
    @seokeys = @ovode.try(:seokeywords)
    respond_to do |format|
      format.html # index.html.erb
    end
    
    
  end

  # GET /ovodes/1
  # GET /ovodes/1.json
  def show
    @ovode = Ovode.find_by_url(params[:id])
    
    @title = @ovode.try(:seotitle)
    @seodesc = @ovode.try(:seodesc)
    @seokeys = @ovode.try(:seokeywords)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ovode }
    end
  end

  # GET /ovodes/new
  # GET /ovodes/new.json
  def new
    @ovode = Ovode.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ovode }
    end
  end

  # GET /ovodes/1/edit
  def edit
    @ovode = Ovode.find_by_url(params[:id])
  end

  # POST /ovodes
  # POST /ovodes.json
  def create
    @ovode = Ovode.new(params[:ovode])

    respond_to do |format|
      if @ovode.save
        format.html { redirect_to @ovode, notice: 'ovode was successfully created.' }
        format.json { render json: @ovode, status: :created, location: @ovode }
      else
        format.html { render action: "new" }
        format.json { render json: @ovode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ovodes/1
  # PUT /ovodes/1.json
  def update
    @ovode = Ovode.find_by_url(params[:id])

    respond_to do |format|
      if @ovode.update_attributes(params[:ovode])
        format.html { redirect_to @ovode, notice: 'ovode was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ovode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ovodes/1
  # DELETE /ovodes/1.json
  def destroy
    @ovode = Ovode.find_by_url(params[:id])
    @ovode.destroy

    respond_to do |format|
      format.html { redirect_to ovodes_url }
      format.json { head :no_content }
    end
  end

  def list
    @ovodes = Ovode.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ovodes }
    end
  end

  def sitemap
    @categories = Category.select("id, title, url").all
    @accessories = Accessory.select("id, title").all
    @coolers = Cooler.select("id, title").all
    @pages= ovode.where(:category_id => nil).select("id, title, url").all
    @newspages = Newspage.select("id, title").all
    @specoffers = Specoffer.select("id, title").all
  end
end
