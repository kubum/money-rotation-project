MoneyRotationProject::Application.routes.draw do

  scope "api" do
    resources :records, :except => [:new, :show, :edit] do
      get 'statistics', :on => :collection
    end
  end
  
  devise_for :users, :controllers => { 
    :registrations => :registrations
  }
  
  get "interface" => "interface#index"
  
  get "userinfo" => "users#show" 
  
	root to: "home#index"
end
