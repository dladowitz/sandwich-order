require 'spec_helper'

describe Order do
  before :each do
    @order = Order.new(:description => 'BLT', :ordered_by => 'David')   
  end
  
  it { @order.save.should be true }
  it { @order.description.should_not be nil }
  it { @order.ordered_by.should_not be nil }
  it { @order.should be_an_instance_of Order}
end
