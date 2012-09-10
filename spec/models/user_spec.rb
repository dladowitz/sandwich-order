require 'simplecov'
SimpleCov.start
require 'spec_helper'

describe User do
  before :each do
    @user = User.new(:email => 'test@nowheres.com', :password => 123456, :password_confirmation => 123456 )   
  end
  
  it { @user.save.should be true }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should be_an_instance_of User}
  
end
