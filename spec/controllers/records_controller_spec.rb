require 'spec_helper'

describe RecordsController do
  describe "unauthorized access" do
    describe "is not successful without authorization" do
      it("access index") { get :index, format: :json }
      it("access create") { post :create, format: :json }
      it("access update") { put :update, { :id => 1 }, format: :json }
      it("access destroy") { delete :destroy, { :id => 1 }, format: :json }
      it("access statistics") { get :statistics, format: :json }

      after(:each) do
        response.should_not be_success
      end
    end
  end
end