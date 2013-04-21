require "spec_helper"

feature "Authentication feature" do
  include SeleniumHelper
  
  Capybara.default_wait_time = 5  
  
  scenario "user should be able to register", :js => true do    
    visit "/"
    
    click_link "Sign up"
    
    within("#new_user") do
      fill_in 'user[email]', :with => "test@email.com"
      fill_in 'user[password]', :with => "password"
      fill_in 'user[password_confirmation]', :with => "password"
    end
    
    click_button "Sign up"
    
    current_path.should == interface_path
    
    User.all.count.should == 1
  end
  
  scenario "user should sign in", :js => true do
    user = FactoryGirl.create(:user)
    authorize(user)
  end
    
end