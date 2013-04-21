module SeleniumHelper
  def authorize(user)
    visit "/"
        
    within("#new_user") do
      fill_in 'user[email]', :with => user.email
      fill_in 'user[password]', :with => "password"
    end
  
    click_button "Sign in"
  
    current_path.should == interface_path
  end
end