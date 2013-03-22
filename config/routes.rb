MoneyRotationProject::Application.routes.draw do

  scope "api" do
    resources :records
  end
  
  devise_for :users

	root to: "application#index"
end
