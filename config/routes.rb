# Start of the routes

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'pages#home'

  resources :users, only: %i[show edit update] do
    resources :recipes, only: %i[new create] # Recipes need to be created by a user.
    resources :reviews, only: %i[index] # To be able to see what reviews the user has created.
  end

  resources :recipes, only: %i[index show edit update] do
    resources :reviews, only: %i[new create] # Reviews need to be attached to a recipe.
    resources :bookmarks, only: %i[new create] # Bookmarks are attached to a recipe.
  end

  resources :reviews, only: %i[show edit update] # Reviews can be shown and edited on their own.
  resources :bookmarks, only: %i[destroy] # Bookmarks can be deleted on their own.
end
