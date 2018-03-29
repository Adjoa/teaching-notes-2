Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'students#index'
  
  resources :students do
   resources :entries, except: [:index]
  end
  
  resources :rehearsals
  resources :events
  
  get '*a', :to => 'errors#routing'
end
