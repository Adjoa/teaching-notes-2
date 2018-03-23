Rails.application.routes.draw do
  root 'teachers#welcome'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  
  resources :teachers, except: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
