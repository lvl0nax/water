class QuickOrdersController < ApplicationController
  before_filter :admin_require, :except => [ :new, :create ]
  # GET /quick_orders
  # GET /quick_orders.json
  def index
    @quick_orders = QuickOrder.last(40).reverse

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
    @quick_order.date = Date.strptime(params[:quick_order][:date].to_s, '%m/%d/%Y')
    # @quick_order.date = params[:quick_order][:date].to_date
    respond_to do |format|
      if @quick_order.save

        format.html { redirect_to thanks_quick_orders_path, notice: 'Quick order was successfully created.' }
        OrderMailer.new_order_mail(@quick_order).deliver
        OrderMailer.dev_mail(@quick_order).deliver
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

  def thanks
  end
end
