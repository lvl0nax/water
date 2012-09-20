class RequestCallsController < ApplicationController
  before_filter :admin_require, :except => [ :new, :create ]
  # GET /request_calls
  # GET /request_calls.json
  def index
    @request_calls = RequestCall.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @request_calls }
    end
  end

  # GET /request_calls/1
  # GET /request_calls/1.json
  def show
    @request_call = RequestCall.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @request_call }
    end
  end

  # GET /request_calls/new
  # GET /request_calls/new.json
  def new
    @request_call = RequestCall.new

    respond_to do |format|
      format.html { render :layout => false }# new.html.erb
      format.json { render json: @request_call }
    end
  end

  # GET /request_calls/1/edit
  def edit
    @request_call = RequestCall.find(params[:id])
  end

  # POST /request_calls
  # POST /request_calls.json
  def create
    @request_call = RequestCall.new(params[:request_call])

    respond_to do |format|
      if @request_call.save
        format.html { redirect_to @request_call, notice: 'Request call was successfully created.' }
        format.json { render json: @request_call, status: :created, location: @request_call }
      else
        format.html { render action: "new" }
        format.json { render json: @request_call.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /request_calls/1
  # PUT /request_calls/1.json
  def update
    @request_call = RequestCall.find(params[:id])

    respond_to do |format|
      if @request_call.update_attributes(params[:request_call])
        format.html { redirect_to @request_call, notice: 'Request call was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @request_call.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_calls/1
  # DELETE /request_calls/1.json
  def destroy
    @request_call = RequestCall.find(params[:id])
    @request_call.destroy

    respond_to do |format|
      format.html { redirect_to request_calls_url }
      format.json { head :no_content }
    end
  end
end
