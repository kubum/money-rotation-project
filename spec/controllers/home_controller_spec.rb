require 'spec_helper'

describe HomeController do

  describe "unauthorized access" do
    describe "is not successful without authorization" do
      it "access index" do
        get :index
        
        response.should_not be_success
        response.should redirect_to new_user_session_path
      end
    end
  end
  
  describe "authorized access" do
    login_user
    
    describe "is successful with authorization" do
      it "access index" do
        get :index
        
        response.should_not be_success
        response.should redirect_to interface_path
      end
    end
  end
  
end
