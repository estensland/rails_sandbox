Rails.application.routes.draw do

  root "site#index"
  get "posts/" => "posts#index"
  get "posts/:id" => "posts#show"

  get "tags/" => "tags#index"
  get "tags/:id" => "tags#show"

  get "comments/" => "comments#index"
  get "comments/:id" => "comments#show"

  post "fs/" => 'flying_switch#async'

end
