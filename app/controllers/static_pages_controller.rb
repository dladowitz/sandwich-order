class StaticPagesController < ApplicationController
  def index
     if signed_in?
       redirect_to new_order_path 
     end
   end
end
