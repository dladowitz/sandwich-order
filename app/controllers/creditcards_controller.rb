class CreditcardsController < ApplicationController
  def new
  end

  def create
      @order = Order.first
      current_user.create_stripe_customer_id(params[:stripeToken])
      User.last.charge_card(current_user)

      redirect_to new_order_path
  end

  def show
  end
end
