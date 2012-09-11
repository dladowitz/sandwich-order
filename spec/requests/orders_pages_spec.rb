require 'spec_helper'

describe "Orders pages" do
  subject { page }
  let(:user) { Fabricate(:user) }
  let(:order) { Fabricate(:order) }
  
  describe "order#new" do
      context "when logged out" do
        before { visit new_order_path }
        it { should have_content('Famous Sandwiches') }
      end # when logged out
  #     
  #     # context "when logged in" do
  #     #   before { visit new_order_path }
  #     #   it { should have_content('Famous Sandwiches') }
  #     # end # when logged in
  #     
  end
  
  describe "filling in an order" do
    before do
      visit new_user_session_path
      fill_in "Email", :with => user.email
      fill_in "Password", :with => user.password
      click_button "Sign in"
    end
    
    it "creates a sandwich order" do
      visit new_order_path 
      fill_in "order_ordered_for", :with => "david l"
      expect { click_button "Create Order" }.to change(Order, :count).by(1)
      # save_and_open_page
      
    end   
    
    # it "saves a sandwich with a request" do
    #   visit new_order_path 
    #   fill_in "order[requests]", :with => "Extra gooey"
    #   expect { click_button "Sudo make me a sandwich" }.to change(Order, :count).by(1)
    # end
  end


end
