Rails.application.routes.draw do

  root 'events#index'

  devise_for :users

  resources :events

  resources :attendances, only: [:index]

  post "events/:id/attendances", to: "attendances#new", as: "inscription"

  get "events/:id/attendances/index", to: "attendances#index", as: "mon_event"


  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end


  get 'static_pages/index', to: 'static_pages#index'
  get 'static_pages/secret'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
