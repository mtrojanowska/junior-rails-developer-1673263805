# frozen_string_literal: true

Rails.application.routes.draw do  

  devise_for :authors
  root to: 'home#index'
    
  devise_scope :author do
    get '/authors/sign_out', to: 'devise/sessions#destroy'
  end
end
