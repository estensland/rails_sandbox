Rails.application.routes.draw do

  root "site#index"
  get "posts/" => "posts#index"
  get "posts/:id" => "posts#show"

  post "fs/" => 'flying_switch#async'

end
