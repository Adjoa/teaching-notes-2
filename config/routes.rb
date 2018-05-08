Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'students#index'
  
  resources :students do
   get '/entries/ids', :to => 'entries#get_ids'
   resources :entries, except: [:index]
   get '/entries/:id/entry_data', :to => 'entries#entry_data'
  end
  
  get '/more_students', :to => 'students#more'
  
  resources :rehearsals
  
  resources :events do
    resources :rehearsals, only: [:index]
  end
  
  resources :comments, only: [:create]
  
  get '*a', :to => 'errors#routing'
end
