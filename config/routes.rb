MoneyRotationProject::Application.routes.draw do

  scope "api" do
    resources :records
  end
  
  devise_for :users
  
  get "interface" => "interface#index"
  
	root to: "home#index"
end
