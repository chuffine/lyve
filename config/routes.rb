Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => { sign_in: "login", sign_out: "logout", sign_up: "register" }

  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'

  authenticated :user do
    root to: 'users#dashboard', as: :authenticated_root
  end

  root 'static_pages#home'

  resources :users, only: [:show, :dashboard, :index] do
    member do
      get :following, :followers, :subscribe
    end
    resources :channels do
      member do
        get :subscribing
      end
    end
  end
  #resources :users,         only: [:show, :dashboard]
  resources :posts,         only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :subscriptions, only: [:create, :destroy]
  # resources :users,only: [:show, :dashboard] do
  #   resources :channels
  # end
  # scope ":username" do
  #   get '', to: 'users#show'
  # end
end
