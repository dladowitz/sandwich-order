require 'spec_helper'

describe "Orders pages" do
  subject { page }
  let(:order) { Fabricate(:order) }
  let(:user) { Fabricate(:user) }
  
  describe "orders#new" do
    
    describe "when not logged in" do
      before { visit new_order_path }
      it { should have_content('Famous Sandwiches') }
    end
    
    describe "when logged in" do
      before do
        visit new_user_registration
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Sign in"
 
        visit new_order_path
      end
    
  end
 
end
