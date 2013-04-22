# -*- encoding : utf-8 -*-
class HelptextsController < ApplicationController
  before_filter :admin_require
  # GET /helptexts
  # GET /helptexts.json
  def index
    @helptexts = Helptext.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @helptexts }
    end
  end

  # GET /helptexts/1
  # GET /helptexts/1.json
  def show
    @helptext = Helptext.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @helptext }
    end
  end

  # GET /helptexts/new
  # GET /helptexts/new.json
  def new
    @helptext = Helptext.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @helptext }
    end
  end

  # GET /helptexts/1/edit
  def edit
    @helptext = Helptext.find(params[:id])
  end

  # POST /helptexts
  # POST /helptexts.json
  def create
    @helptext = Helptext.new(params[:helptext])

    respond_to do |format|
      if @helptext.save
        format.html { redirect_to @helptext, notice: 'Helptext was successfully created.' }
        format.json { render json: @helptext, status: :created, location: @helptext }
      else
        format.html { render action: "new" }
        format.json { render json: @helptext.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /helptexts/1
  # PUT /helptexts/1.json
  def update
    @helptext = Helptext.find(params[:id])

    respond_to do |format|
      if @helptext.update_attributes(params[:helptext])
        format.html { redirect_to @helptext, notice: 'Helptext was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @helptext.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /helptexts/1
  # DELETE /helptexts/1.json
  def destroy
    @helptext = Helptext.find(params[:id])
    @helptext.destroy

    respond_to do |format|
      format.html { redirect_to helptexts_url }
      format.json { head :no_content }
    end
  end
end
