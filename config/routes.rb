Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'index#index'
  get '/team', to: 'index#team'
  get '/contact', to: 'index#contact'
  get 'welcome/:first_name', to: 'index#welcomeName'
  get 'gossip/:id', to: 'gossip#showGossip'
  get 'user/:id', to: 'user#showUser'
end
