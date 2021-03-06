class OrdersController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    if current_user.stripe_customer_id == nil
       redirect_to new_creditcard_path  
    else
       @order = Order.new
    end

    # respond_to do |format|
    #   format.html # new.html.erb
    #   format.json { render json: @order }
    # end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])

    respond_to do |format|
      if @order.save
        format.html do 
          if current_user.stripe_customer_id 
            User.last.charge_card(current_user)
            redirect_to @order, notice: 'Order was successfully created.' 
          else
            redirect_to new_creditcard_path
          end     
        end
        
        # format.json { render json: @order, status: :created, location: @order }
        
        @order.send_email(@order.ordered_for, @order.description)  #Turn on and off email confirmation here
        @order.send_fax(@order.description)                       #Turn faxing to waiters on wheels here 
      else
        flash.now[:error] = "C'mon now. We pinkie swear not to sell your name to anyone" # Not quite right!
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
end
