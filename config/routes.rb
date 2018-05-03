Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'students#index'
  
  resources :students do
   resources :entries, except: [:index]
  end
  
  get '/more_students', :to => 'students#more'
  
  resources :rehearsals
  resources :events
  resources :comments, only: [:create]
  
  get '*a', :to => 'errors#routing'
end
