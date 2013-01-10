
# -*- encoding : utf-8 -*-
class WaterbottlesController < ApplicationController
  before_filter :admin_require, :except => [ :show, :index ]
  # GET /waterbottles
  # GET /waterbottles.json
  def index
    @waterbottles = Waterbottle.order("volume DESC").all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @waterbottles }
    end
  end

  # GET /waterbottles/1
  # GET /waterbottles/1.json
  def show
    @waterbottle = Waterbottle.find(params[:id])

    @title = @waterbottle.try(:seotitle)
    @seodesc = @waterbottle.try(:seodesc)
    @seokeys = @waterbottle.try(:seokeywords)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @waterbottle }
    end
  end

  # GET /waterbottles/new
  # GET /waterbottles/new.json
  def new
    @waterbottle = Waterbottle.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @waterbottle }
    end
  end

  # GET /waterbottles/1/edit
  def edit
    @waterbottle = Waterbottle.find(params[:id])
  end

  # POST /waterbottles
  # POST /waterbottles.json
  def create
    @waterbottle = Waterbottle.new(params[:waterbottle])

    respond_to do |format|
      if @waterbottle.save
        format.html { redirect_to waterbottles_url, notice: 'Waterbottle was successfully created.' }
        format.json { render json: @waterbottle, status: :created, location: @waterbottle }
      else
        format.html { render action: "new" }
        format.json { render json: @waterbottle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /waterbottles/1
  # PUT /waterbottles/1.json
  def update
    @waterbottle = Waterbottle.find(params[:id])

    respond_to do |format|
      if @waterbottle.update_attributes(params[:waterbottle])
        format.html { redirect_to @waterbottle, notice: 'Waterbottle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @waterbottle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /waterbottles/1
  # DELETE /waterbottles/1.json
  def destroy
    @waterbottle = Waterbottle.find(params[:id])
    @waterbottle.destroy

    respond_to do |format|
      format.html { redirect_to waterbottles_url }
      format.json { head :no_content }
    end
  end
end
