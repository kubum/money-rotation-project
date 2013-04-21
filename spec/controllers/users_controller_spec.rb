require 'spec_helper'

describe UsersController do
  describe "unauthorized access" do
    describe "is not successful without authorization" do
      it("access show") { get :show, id: 1 }

      after(:each) do
        response.should_not be_success
        response.should redirect_to(new_user_session_path)
      end
    end
  end
  
  describe "authorized access" do
    login_user
    
    describe "is successful with authorization" do
      it("access show") { get :show, id: @user.id, format: :json }

      after(:each) do
        response.should be_success
      end
    end
  end
end
