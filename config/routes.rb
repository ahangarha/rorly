Rails.application.routes.draw do
  resources :urls, only: [:show, :new, :create]

  root 'urls#new'
end
