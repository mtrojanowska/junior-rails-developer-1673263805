# frozen_string_literal: true

Rails.application.routes.draw do  

  get  'render/index'  
  root to: 'render#index'

  devise_for :authors
  # root to: 'home#index'

  namespace :author do
    root to: "posts#index"
  end
    
  devise_scope :author do
    get '/authors/sign_out', to: 'devise/sessions#destroy'
    
  resources :posts

  resources :categories, except: [:show, :destroy]
  end
end
