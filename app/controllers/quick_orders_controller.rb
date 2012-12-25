class QuickOrdersController < ApplicationController
  before_filter :admin_require, :except => [ :new, :create ]
  # GET /quick_orders
  # GET /quick_orders.json
  def index
    @quick_orders = QuickOrder.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @quick_orders }
    end
  end

  # GET /quick_orders/1
  # GET /quick_orders/1.json
  def show
    @quick_order = QuickOrder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @quick_order }
    end
  end

  # GET /quick_orders/new
  # GET /quick_orders/new.json
  def new
    @quick_order = QuickOrder.new

    respond_to do |format|
      format.html { render :layout => false }# new.html.erb
      format.json { render json: @quick_order }
    end
  end

  # GET /quick_orders/1/edit
  def edit
    @quick_order = QuickOrder.find(params[:id])
  end

  # POST /quick_orders
  # POST /quick_orders.json
  def create
    @quick_order = QuickOrder.new(params[:quick_order])
    
    @quick_order.date = params[:quick_order][:date].to_date
    logger.debug "sssssssssssssssssssssssssssssssssssssssssssss"
    logger.debug @quick_order.date
    respond_to do |format|
      if @quick_order.save
        OrderMailer.new_order_mail(@quick_order).deliver



        format.html { redirect_to @quick_order, notice: 'Quick order was successfully created.' }
        format.json { render json: @quick_order, status: :created, location: @quick_order }
      else
        format.html { render action: "new" }
        format.json { render json: @quick_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /quick_orders/1
  # PUT /quick_orders/1.json
  def update
    @quick_order = QuickOrder.find(params[:id])

    respond_to do |format|
      if @quick_order.update_attributes(params[:quick_order])
        format.html { redirect_to @quick_order, notice: 'Quick order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @quick_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quick_orders/1
  # DELETE /quick_orders/1.json
  def destroy
    @quick_order = QuickOrder.find(params[:id])
    @quick_order.destroy

    respond_to do |format|
      format.html { redirect_to quick_orders_url }
      format.json { head :no_content }
    end
  end
end
