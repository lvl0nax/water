class InfopagesController < ApplicationController
  before_filter :admin_require, :except => [ :show, :index ]
  # GET /infopages
  # GET /infopages.json
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
    @infopage = Infopage.find_by_url(params[:id])
  end

  # GET /infopages/1
  # GET /infopages/1.json
  def show
    @infopage = Infopage.find_by_url(params[:id])
    @root = @infopage.parent
    @title = @infopage.try(:seotitle)
    @seodesc = @infopage.try(:seodesc)
    @seokeys = @infopage.try(:seokeywords)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @infopage }
    end
  end

  # GET /infopages/new
  # GET /infopages/new.json
  def new
    @infopage = Infopage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @infopage }
    end
  end

  # GET /infopages/1/edit
  def edit
    @infopage = Infopage.find_by_url(params[:id])
  end

  # POST /infopages
  # POST /infopages.json
  def create
    @infopage = Infopage.new(params[:infopage])

    respond_to do |format|
      if @infopage.save
        format.html { redirect_to @infopage, notice: 'Infopage was successfully created.' }
        format.json { render json: @infopage, status: :created, location: @infopage }
      else
        format.html { render action: "new" }
        format.json { render json: @infopage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /infopages/1
  # PUT /infopages/1.json
  def update
    @infopage = Infopage.find_by_url(params[:id])

    respond_to do |format|
      if @infopage.update_attributes(params[:infopage])
        format.html { redirect_to @infopage, notice: 'Infopage was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @infopage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /infopages/1
  # DELETE /infopages/1.json
  def destroy
    @infopage = Infopage.find_by_url(params[:id])
    @infopage.destroy

    respond_to do |format|
      format.html { redirect_to infopages_url }
      format.json { head :no_content }
    end
  end

  def list
    @infopages = Infopage.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @infopages }
    end
  end

  def sitemap
    @categories = Category.select("id, title, url").all
    @accessories = Accessory.select("id, title").all
    @coolers = Cooler.select("id, title").all
    @pages= Infopage.where(:category_id => nil).select("id, title, url").all
    @newspages = Newspage.select("id, title").all
    @specoffers = Specoffer.select("id, title").all
  end
end
