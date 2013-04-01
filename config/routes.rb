MoneyRotationProject::Application.routes.draw do

  scope "api" do
    resources :records
  end
  
  devise_for :users, :controllers => { 
    :registrations => :registrations
  }
  
  get "interface" => "interface#index"
  
  get "userinfo" => "users#show" 
  
	root to: "home#index"
end
