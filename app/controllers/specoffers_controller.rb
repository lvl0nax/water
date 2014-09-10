class SpecoffersController < ApplicationController
  before_filter :admin_require, :except => [ :show, :index ]
  # GET /specoffers
  # GET /specoffers.json
  def index
    @specoffers = Specoffer.order('created_at DESC').all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @specoffers }
    end
  end

  # GET /specoffers/1
  # GET /specoffers/1.json
  def show
    @specoffer = Specoffer.find(params[:id])
    @title = @specoffer.try(:seotitle)
    @seodesc = @specoffer.try(:seodesc)
    @seokeys = @specoffer.try(:seokeywords)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @specoffer }
    end
  end

  # GET /specoffers/new
  # GET /specoffers/new.json
  def new
    @specoffer = Specoffer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @specoffer }
    end
  end

  # GET /specoffers/1/edit
  def edit
    @specoffer = Specoffer.find(params[:id])
  end

  # POST /specoffers
  # POST /specoffers.json
  def create
    @specoffer = Specoffer.new(params[:specoffer])

    respond_to do |format|
      if @specoffer.save
        format.html { redirect_to @specoffer, notice: 'Specoffer was successfully created.' }
        format.json { render json: @specoffer, status: :created, location: @specoffer }
      else
        format.html { render action: "new" }
        format.json { render json: @specoffer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /specoffers/1
  # PUT /specoffers/1.json
  def update
    @specoffer = Specoffer.find(params[:id])

    respond_to do |format|
      if @specoffer.update_attributes(params[:specoffer])
        format.html { redirect_to @specoffer, notice: 'Specoffer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @specoffer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specoffers/1
  # DELETE /specoffers/1.json
  def destroy
    @specoffer = Specoffer.find(params[:id])
    @specoffer.destroy

    respond_to do |format|
      format.html { redirect_to specoffers_url }
      format.json { head :no_content }
    end
  end
end
