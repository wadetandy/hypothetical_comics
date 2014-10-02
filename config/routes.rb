Rails.application.routes.draw do
  get 'index/index'

  resources :stories do
    member do
      post 'upvote'
      post 'downvote'
    end

    resources :comments do
      member do
        post 'upvote'
        post 'downvote'
      end
    end
  end

  resources :users do
    member do
      get :stories
    end
  end

  devise_for :users, controllers: {registrations: "users/registrations", sessions: "users/sessions", passwords: "users/passwords", omniauth_callbacks: "users/omniauth_callbacks"}, skip: [:sessions, :registrations]

  root 'index#index'

  devise_scope :user do
    get    "login"   => "devise/sessions#new",         as: :new_user_session
    post   "login"   => "devise/sessions#create",      as: :user_session
    delete "signout" => "devise/sessions#destroy",     as: :destroy_user_session

    get    "signup"  => "devise/registrations#new",    as: :new_user_registration
    post   "signup"  => "devise/registrations#create", as: :user_registration
    put    "signup"  => "devise/registrations#update", as: :update_user_registration
    get    "account" => "devise/registrations#edit",   as: :edit_user_registration
  end
end
