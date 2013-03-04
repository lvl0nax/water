# -*- encoding : utf-8 -*-
# -*- coding : utf-8 -*-
class QuickOrdersController < ApplicationController
  before_filter :admin_require,
      :except => [ :new, :create, :thanks]#, :add_to_cart, :show_cart, :clear_cart, :new_cart ]
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
    #@quick_order.date = Date.strptime(params[:quick_order][:date].to_s, '%m/%d/%Y')
    # @quick_order.date = params[:quick_order][:date].to_date
    respond_to do |format|
      if @quick_order.save

        format.html { redirect_to thanks_quick_orders_path, notice: 'Quick order was successfully created.' }
        OrderMailer.new_order_mail(@quick_order).deliver
        #OrderMailer.dev_mail(@quick_order).deliver
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


  def add_to_cart
    session[:cart] ||= {}
    session[:cart].merge!({params[:item].to_sym => params[:count].to_i}){|k, ov, nv| ov + nv}
    render json: session[:cart].values.sum
  end

  def show_cart
    @cart = session[:cart]
    # @price
    # @cart.map do |k,v|
    #   k.to_s.split('_')[0].constantize.find(k.to_s.split('_')[1].to_i)
    # end
    respond_to do |format|
      format.html {render layout: false}
    end
  end

  def clear_cart
    session[:cart] = {}
    render nothing: true
    #render json: "test"
  end

  def calc_price obj, kolvo
    return obj.price * kolvo if obj.class.to_s != 'Waterbottle'
    #obj.calprice(kolvo)
    "Цена зависит от типа покупателя и количества."
  end

  def new_cart
    @cart = session[:cart]
  end

  def create_cart
    @cart = session[:cart]
    @shop_cart = ShoppingCart.create(params[:shopping_cart])
    respond_to do |format|
      if @shop_cart == ShoppingCart.last
        @cart.map do |k,v|
          klass, id = k.to_s.split('_')[0..1]
          ShoppingCartItem.create(owner_id: @shop_cart.id,
                                  owner_type: 'ShoppingCart',
                                  quantity: v.to_i,
                                  item_id: id,
                                  item_type: klass,
                                  price: 1)
          #@shop_cart.add(klass.constantize.find(id.to_i), 1, v)
        end
        format.html { redirect_to thanks_quick_orders_path, notice: 'Order was successfully created.' }
        OrderMailer.new_cart_mail(@shop_cart).deliver
        session[:cart] = {}
        #OrderMailer.dev_mail(@shop_cart).deliver
        # format.json { render json: @shop_cart, status: :created, location: @shop_cart }
      else
        format.html { render action: "new_cart" }
        format.json { render json: @shop_cart.errors, status: :unprocessable_entity }
      end
    end
  end
end
