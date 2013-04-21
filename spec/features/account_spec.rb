require "spec_helper"

feature "Account feature" do
  include SeleniumHelper
  
  Capybara.default_wait_time = 5  
    
  before(:each) do
    @user = FactoryGirl.create(:user)
    authorize(@user)
  end
    
  scenario "edit email", :js => true do    
    new_email = "example@test.com"
      
    click_button "Account"
    
    within("#edit_user") do
      fill_in 'user[email]', :with => new_email
      fill_in 'user[current_password]', :with => "password"
    end
    
    click_button "Update"
    
    page.should have_content("Success! User was successfully edited")
  end
  
  scenario "edit email invalid", :js => true do    
    new_email = "example@test.com"
      
    click_button "Account"
    
    within("#edit_user") do
      fill_in 'user[email]', :with => new_email
      fill_in 'user[current_password]', :with => "INCORRECT"
    end
    
    click_button "Update"
    
    page.should have_content("Errors!")
  end
  
end