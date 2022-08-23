Rails.application.routes.draw do
  resources :urls, only: [:show, :new, :create]

  get '/:hash', to: 'urls#redirect', constraints: { id: /^[\w\d=]{4,}/ }
  root 'urls#new'
end
