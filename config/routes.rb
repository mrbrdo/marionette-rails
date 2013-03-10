MarionetteRails::Application.routes.draw do
  resources :posts
end

BackboneRoutes.draw("pages#home") do
  root to: 'index'
  match 'index' => 'index'
  match 'new' => 'new'
  match ':id' => 'show'
  match ':id/edit' => 'edit'
end
