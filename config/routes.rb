Rails.application.routes.draw do

 get '/help' => 'application#help'

  resources :pictures do
    resources :tags
  end
  resources :pictures do
    member do
      post'crop'
      get 'crop'
    end
    resources :tags
  end
  root to: 'pictures#index'
end
