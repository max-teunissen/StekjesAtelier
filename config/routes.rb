# frozen_string_literal: true

Rails.application.routes.draw do
  resources :categories
  devise_for :admins
  devise_for :users do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Home page
  root to: 'pages#home', as: :home

  # about and info page
  get 'about', to: 'pages#about'

  # hoe moet je bestellen pagina
  get 'bestellen', to: 'pages#bestellen', as: :bestellen

  # bekijk het hele assortiment
  get 'assortiment', to: 'pages#assortiment', as: :assortiment

  # stekjes CRUD
  # all stekjes
  get 'stekjes', to: 'stekjes#index', as: :allstekjes

  # create a new stekje
  post 'stekjes', to: 'stekjes#create'
  get 'stekjes/new', to: 'stekjes#new', as: :new

  # edit an existing stekje
  # make the changes
  get 'stekjes/:id/edit', to: 'stekjes#edit', as: :editstekje
  # save the changes made
  patch 'stekjes/:id', to: 'stekjes#update'

  # delete an existing stekje
  delete 'stekjes/:id', to: 'stekjes#destroy'

  # show one stekje
  get 'stekjes/:id', to: 'stekjes#show', as: :stekje

  # show a user's profile
  get 'private_profile', to: 'profiles#private'

  # plantjes category show
  get 'plantjes', to: 'stekjes#plantjes', as: :plantjes
end
