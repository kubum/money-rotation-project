require "spec_helper"

feature "Records feature" do
  include SeleniumHelper
  
  Capybara.default_wait_time = 5  
    
  before(:each) do
    @user = FactoryGirl.create(:user)
    authorize(@user)
  end
    
  scenario "add record", :js => true do      
    click_button "Add record"
    
    within("#new_record") do
      fill_in 'comment', :with => "it is a comment"
      fill_in 'amount', :with => 150
      
      choose "Expense"
    end
    
    click_button "new_record_submit"
    
    all("#records-region table tbody tr").count.should == 1
  end
  
  scenario "add record invalid", :js => true do      
    click_button "Add record"
    
    within("#new_record") do
      fill_in 'comment', :with => "it is a comment"
      fill_in 'amount', :with => -500
    end
    
    click_button "new_record_submit"
    
    page.should have_content("Errors!")
  end
end