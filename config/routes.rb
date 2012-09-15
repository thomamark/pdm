Pdm::Application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  get "static_pages/home"
  root to: 'static_pages#home'


  match '/restart', to: 'sessions#destroy', via: :delete
end
