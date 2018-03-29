Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'students#index'
  
  resources :students do
   resources :entries, only: [:index, :new, :create, :show, :edit, :update]
  end
  
  resources :entries, only:  [:destroy]
  
  resources :rehearsals
  
  resources :events
end
