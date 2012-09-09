class CreditcardsController < ApplicationController
  def new
  end

  def create
      @order = Order.first
      @order.create_stripe_customer_id(params[:stripeToken])

      redirect_to new_order_path
  end

  def show
  end
end
