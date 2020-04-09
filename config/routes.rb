# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Home page
  root to: 'pages#home'

  # about and info page
  get 'about', to: 'pages#about'
end
