Rails.application.routes.draw do

  root "posts#index"
  get "posts/" => "posts#index"
  get "posts/:id" => "posts#show"

end
