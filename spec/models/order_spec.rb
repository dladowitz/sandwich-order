require 'simplecov'
SimpleCov.start
require 'spec_helper'

describe Order do
  before :each do
    @order = Order.new(:description => 'BLT', :ordered_by => 'David')   
  end
  
  it { @order.save.should be true }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:ordered_by) }
  it { should respond_to(:description) }
  it { should respond_to(:ordered_by) }
  it { should be_an_instance_of Order}
  
  it "should be able to send en email notification" do
    @order.send_email should be true
  end
  
end
