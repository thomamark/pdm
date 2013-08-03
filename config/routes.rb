Pdm::Application.routes.draw do
  get "static_pages/home"
  get "static_pages/play"

  resources :scores

  if Rails.env.development?
    get "static_pages/lb"
    match "/lb" => "static_pages#lb" 
  end

  match "/play" => "static_pages#play"
  root to: 'static_pages#home'

end
