class CoolersController < ApplicationController
  before_filter :admin_require, :except => [ :show, :index ]
  # GET /coolers
  # GET /coolers.json
  def index
    @coolers = Cooler.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @coolers }
    end
  end

  # GET /coolers/1
  # GET /coolers/1.json
  def show
    @cooler = Cooler.find(params[:id])
    @title = @cooler.try(:seotitle)
    @seodesc = @cooler.try(:seodesc)
    @seokeys = @cooler.try(:seokeywords)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cooler }
    end
  end

  # GET /coolers/new
  # GET /coolers/new.json
  def new
    @cooler = Cooler.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cooler }
    end
  end

  # GET /coolers/1/edit
  def edit
    @cooler = Cooler.find(params[:id])
  end

  # POST /coolers
  # POST /coolers.json
  def create
    @cooler = Cooler.new(params[:cooler])

    respond_to do |format|
      if @cooler.save
        format.html { redirect_to @cooler, notice: 'Cooler was successfully created.' }
        format.json { render json: @cooler, status: :created, location: @cooler }
      else
        format.html { render action: "new" }
        format.json { render json: @cooler.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /coolers/1
  # PUT /coolers/1.json
  def update
    @cooler = Cooler.find(params[:id])

    respond_to do |format|
      if @cooler.update_attributes(params[:cooler])
        format.html { redirect_to @cooler, notice: 'Cooler was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cooler.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coolers/1
  # DELETE /coolers/1.json
  def destroy
    @cooler = Cooler.find(params[:id])
    @cooler.destroy

    respond_to do |format|
      format.html { redirect_to coolers_url }
      format.json { head :no_content }
    end
  end
end
