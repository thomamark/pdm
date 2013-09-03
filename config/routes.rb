Pdm::Application.routes.draw do
  get "static_pages/home"
  get "static_pages/play"
  get "static_pages/rank"

  resources :scores

  if Rails.env.development?
    get "static_pages/lb"
    get "static_pages/gmm"
    match "/lb" => "static_pages#lb" 
    match "/gmm" => "static_pages#gmm" 
  end

  match "/play" => "static_pages#play"
  match "/myRank" => "static_pages#rank"
  root to: 'static_pages#home'

end
