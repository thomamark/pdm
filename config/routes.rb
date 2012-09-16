Pdm::Application.routes.draw do
  get "static_pages/home"
  get "static_pages/play"

  match "/play" => "static_pages#play"

  root to: 'static_pages#home'

end
