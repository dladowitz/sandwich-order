class CreditcardsController < ApplicationController
  def new
  end

  def create
      @order = Order.first
      current_user.create_stripe_customer_id(params[:stripeToken])

      redirect_to order_path(Order.last)
  end

  def show
  end
end
