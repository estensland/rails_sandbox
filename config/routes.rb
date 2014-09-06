Rails.application.routes.draw do

  root "site#index"
  get "posts/" => "posts#index"
  get "posts/:id" => "posts#show"
  get "posts/:post_id/comments/:id" => "comments#show"
  
  get "comments/" => "comments#index"


  get "tags/" => "tags#index"
  get "tags/:id" => "tags#show"


  post "fs/" => 'flying_switch#async'

end
