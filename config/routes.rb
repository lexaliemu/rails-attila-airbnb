Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :movies do
    resources :rentings
    collection do
      get 'profile', to: "movies#profile"
      get 'purchase', to: "movies#purchase"
    end
    resources :reviews
  end
end
